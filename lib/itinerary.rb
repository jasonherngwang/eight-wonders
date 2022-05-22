# require_relative "shortest_path_algos"

class Itinerary
  attr_reader :id, :code, :name, :editable, :destinations

  def initialize(id, code, name, editable, destinations)
    @id = id
    @code = code
    @name = name
    @editable = editable
    @destinations = destinations
  end

  def sort_destinations!
    # Destination 1 is fixed, so only sort when we have 3+ destinations.
    return if @destinations.size <= 2 || !block_given?

    coords = @destinations.map { |d| [d.latitude, d.longitude] }
    idx_mapping = yield(coords)
    
    @destinations.sort_by! do |d|
      idx_mapping[@destinations.index(d)]
    end
  end

  # Returns a hyphen-separated path used for querying gcmap.com
  def flight_path
    current_iatas = @destinations.map(&:iata_code)
    (current_iatas + [current_iatas.first]).join("-")
  end
end

class Destination
  attr_reader :id, :airport_id, :airport_name, :iata_code, :country,
              :municipality, :latitude, :longitude, :experiences

  def initialize(id, airport_id, airport_name, iata_code, country,
                 municipality, latitude, longitude, experiences)
    @id = id
    @airport_id = airport_id
    @airport_name = airport_name
    @iata_code = iata_code
    @country = country
    @municipality = municipality
    @latitude = latitude
    @longitude = longitude
    @experiences = experiences
  end
end

class Experience
  attr_reader :id, :description

  def initialize(id, description)
    @id = id
    @description = description
  end
end
