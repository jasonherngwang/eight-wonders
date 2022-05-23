require_relative "database_connection"
require_relative "itinerary"

class InvalidItineraryCodeError < StandardError; end
class InvalidIataCodeError < StandardError; end
class DuplicateIataCodeError < StandardError; end

class ItineraryHandler
  include DatabaseConnection
  
  # Itinerary-related methods

  # Find high-level itinerary info. Smaller query if we don't need all the details.
  def find_itinerary_info(code)
    sql = <<~SQL
      SELECT *
        FROM itineraries
       WHERE code = $1
       LIMIT 1;
    SQL
    result = query(sql, code)

    if result.ntuples.zero?
      raise InvalidItineraryCodeError, "Itinerary with code #{code} does not exist."
    end

    result.first
  end

  def find_airport_info(iata)
    sql = <<~SQL
      SELECT *
        FROM airports
       WHERE iata_code = $1
       LIMIT 1;
    SQL
    result = query(sql, iata)
    
    if result.ntuples.zero?
      raise InvalidIataCodeError, "Airport with IATA code #{iata} does not exist."
    end

    result.first
  end

  # Retrieve an itinerary from the db, using unique code.
  def find_itinerary_by_code(code)
    sql = <<~SQL
      SELECT i.id            AS itinerary_id,
             i.code          AS itinerary_code,
             i.name          AS itinerary_name,
             i.editable,
             d.id            AS destination_id,
             a.id            AS airport_id,
             a.name          AS airport_name,
             a.iata_code,
             a.country,
             a.municipality,
             a.latitude,
             a.longitude,
             e.id            AS experience_id,
             e.description   AS experience
        FROM itineraries i
        LEFT JOIN destinations d
          ON i.id = d.itinerary_id
        LEFT JOIN airports a
          ON a.id = d.airport_id
        LEFT JOIN experiences e
          ON d.id = e.destination_id
       WHERE i.code = $1
       GROUP BY i.id, d.id, a.id, e.id;
    SQL
    result = query(sql, code)

    if result.ntuples.zero?
      raise InvalidItineraryCodeError, "Itinerary with code #{code} does not exist."
    end

    query_result_to_itinerary(result)
  end

  # Create a new, empty itinerary and store in the db.
  def create_itinerary(code)
    sql = <<~SQL
      INSERT INTO itineraries (code)
      VALUES ($1);
    SQL
    query(sql, code)
  end

  # Delte itinerary from db. Casade deletes any connected destinations and experiences.
  def delete_itinerary(code)
    sql = <<~SQL
      DELETE FROM itineraries
       WHERE code = $1;
    SQL
    query(sql, code)
  end

  # Edit itinerary name
  def update_itinerary_name(code, name)
    sql = <<~SQL
      UPDATE itineraries
         SET name = $1
       WHERE code = $2;
    SQL
    query(sql, name, code)
  end

  # Copy itinerary
  def copy_itinerary(code, new_code)
    create_itinerary(new_code)

    current_itinerary = find_itinerary_by_code(code)
    # Copy destinations to new itinerary
    current_itinerary.destinations.each do |destination|
      add_destination(new_code, destination.iata_code)

      # Find info on newly-created destination.
      new_destination = find_destination_info(new_code, destination.iata_code)
      
      # Copy experiences to new itinerary
      destination.experiences.each do |experience|
        add_experience(new_destination["id"], experience.description)
      end
    end
  end

  # Destination-related methods

  # Add destination to itinerary
  def add_destination(code, iata)
    itinerary = find_itinerary_by_code(code)
    current_iatas = itinerary.destinations.map(&:iata_code)
    airport_info = find_airport_info(iata)

    if current_iatas.include? iata
      raise DuplicateIataCodeError, "Airport #{iata} is already in your itinerary."
    end

    sql = <<~SQL
      INSERT INTO destinations (itinerary_id, airport_id)
      VALUES ($1, $2);
    SQL
    query(sql, itinerary.id, airport_info["id"])
  end

  # Find destination using itinerary code and iata
  def find_destination_info(itinerary_code, iata)
    sql = <<~SQL
      SELECT d.*
        FROM destinations d
        JOIN itineraries i
          ON d.itinerary_id = i.id
        JOIN airports a
          ON d.airport_id = a.id
       WHERE i.code = $1
         AND a.iata_code = $2
       LIMIT 1;
    SQL
    result = query(sql, itinerary_code, iata)

    result.first
  end

  # Delete destination from itinerary
  def delete_destination(id)
    sql = <<~SQL
      DELETE FROM destinations
       WHERE id = $1;
    SQL
    query(sql, id)
  end


  # Experience-related methods

  def add_experience(destination_id, text)
    sql = <<~SQL
      INSERT INTO experiences (destination_id, description)
      VALUES ($1, $2);
    SQL
    query(sql, destination_id, text)
  end

  def delete_experience(id)
    sql = <<~SQL
      DELETE FROM experiences
       WHERE id = $1;
    SQL
    query(sql, id)
  end


  # Helper methods

  # Retrieve all available airports
  def all_iata
    sql = <<~SQL
      SELECT iata_code
        FROM airports;
    SQL
    result = query(sql)

    result.field_values("iata_code")
  end

  private

  def query_result_to_itinerary(result)
    Itinerary.new(
      result.field_values("itinerary_id").first.to_i,
      result.field_values("itinerary_code").first,
      result.field_values("itinerary_name").first,
      result.field_values("editable").first != "f",
      query_result_to_destinations(result)
    )
  end
  
  # Converts a PG Result object to an Array of Destination objects
  def query_result_to_destinations(result)
    return [] if result.first["destination_id"].nil?

    result.group_by { |d| d["destination_id"] }
    .map do |_, data|      
      first_row = data.first
      
      Destination.new(
        first_row["destination_id"].to_i,
        first_row["airport_id"].to_i,
        first_row["airport_name"],
        first_row["iata_code"],
        first_row["country"],
        first_row["municipality"],
        first_row["latitude"].to_f,
        first_row["longitude"].to_f,
        query_result_to_experience(data)
      )
    end
  end
  
  # Converts a Hash to an Array of experience objects
  def query_result_to_experience(data)
    return [] if data.first["experience_id"].nil?

    data.reduce([]) do |arr, elem|
      arr << Experience.new(
        elem["experience_id"].to_i,
        elem["experience"]
      )
    end
  end

end
