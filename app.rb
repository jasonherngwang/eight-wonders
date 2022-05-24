require "bundler/setup"
require "dotenv/load"
require "sinatra"
require "sinatra/content_for"
require "tilt/erubis"
require "nanoid"
require "pry"

require_relative "lib/itinerary_handler"
require_relative "lib/helpers"
require_relative "lib/shortest_path_algos"

# Configuration and Reloading
configure do
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET']
  set :erb, escape_html: true
end

configure(:development) do
  require "sinatra/reloader"
  also_reload "lib/*.rb"
end

# Filters
before do
  @itinerary_handler = ItineraryHandler.new(logger)
end

after do
  @itinerary_handler.disconnect
end

# Routes

# Display landing page
get "/" do
  erb :home, layout: :layout
end

# Create new, empty itinerary
get "/itinerary/new" do
  code = Nanoid.generate(size: 8)
  @itinerary_handler.create_itinerary(code)
  redirect "/itinerary/#{code}"
end

# Validate itinerary code, returning itself if valid.
def validate_itinerary_code(code)
  begin
    itinerary_info = @itinerary_handler.find_itinerary_info(code)
    unless itinerary_info["editable"] == "t"
      session[:error] = "That itinerary is not editable."
      redirect "/"
    end
  rescue InvalidItineraryCodeError => e
    session[:error] = e.message
    redirect "/"
  end

  code
end

# Retrieve existing itinerary
get "/itinerary/retrieve" do
  code = params[:code]
  
  # Check for invalid input
  error = error_for_itinerary_code_format(code)
  if error
    session[:error] = error
    status 422
    redirect "/"
  end
  
  code = validate_itinerary_code(params[:code])
  
  @itinerary_info = @itinerary_handler.find_itinerary_info(code)
  session[:success] = "Itinerary #{code} has been retrieved."
  redirect "/itinerary/#{code}"
end

# Display itinerary
get "/itinerary/:code" do
  code = validate_itinerary_code(params[:code])
  @itinerary = @itinerary_handler.find_itinerary_by_code(code)

  # Available algorithms: sort_longitude, sort_tsp_naive, sort_tsp_dp
  @itinerary.sort_destinations! do |coords|
    sort_tsp_dp(coords)
    # sort_tsp_naive(coords)
    # sort_longitude(coords)
  end
  
  erb :itinerary, layout: :layout
end

# Delete itinerary
post "/itinerary/:code/delete" do
  code = validate_itinerary_code(params[:code])
  @itinerary_handler.delete_itinerary(code)
  session[:success] = "Itinerary #{code} has been deleted."
  redirect "/"
end

# Render form to edit itinerary name
get "/itinerary/:code/edit" do
  code = validate_itinerary_code(params[:code])
  @itinerary_info = @itinerary_handler.find_itinerary_info(code)
  erb :edit_itinerary, layout: :layout
end

# Edit itinerary name
post "/itinerary/:code" do
  code = validate_itinerary_code(params[:code])
  name = params[:name].strip
  @itinerary_info = @itinerary_handler.find_itinerary_info(code)

  error = error_for_itinerary_name(name)
  if error
    session[:error] = error
    status 422
    erb :edit_itinerary, layout: :layout
  else
    @itinerary_handler.update_itinerary_name(code, name)
    session[:success] = "Itinerary name has been changed to \"#{name}\"."
    redirect "/itinerary/#{code}"
  end
end

# Add destination to itinerary
post "/itinerary/:code/destinations" do
  code = validate_itinerary_code(params[:code])
  iata = params[:iata].strip.upcase

  error = error_for_iata_format(iata)
  if error
    session[:error] = error
    status 422
  else
    begin
      @itinerary_handler.add_destination(code, iata)
      session[:success] = "Airport #{iata} has been added to your itinerary."
    rescue InvalidIataCodeError, DuplicateIataCodeError => e
      session[:error] = e.message
    end
  end

  redirect "/itinerary/#{code}"
end

# Delete destination from itinerary
post "/itinerary/:code/destinations/:id/delete" do
  code = validate_itinerary_code(params[:code])
  destination_id = params[:id].to_i

  @itinerary_handler.delete_destination(destination_id)
  session[:success] = "Destination has been deleted."

  redirect "/itinerary/#{code}"
end

# Randomize rest of itinerary (up to 8 destinations)
post "/itinerary/:code/randomize" do
  code = validate_itinerary_code(params[:code])
  @itinerary = @itinerary_handler.find_itinerary_by_code(code)

  current_iatas = @itinerary.destinations.map(&:iata_code)
  all_iata = @itinerary_handler.all_iata()
  available_iata = all_iata.reject do |iata|
    current_iatas.include? iata
  end
  available_iata.sample(8 - current_iatas.size).each do |iata|
    @itinerary_handler.add_destination(code, iata)
  end
  session[:success] = "The rest of your itinerary has been randomized!"

  redirect "/itinerary/#{code}"
end

# Copy an existing itinerary
post "/itinerary/:code/copy" do
  begin
    # Do not validate this code, since it might be an immutable itinerary.
    code = params[:code]
    new_code = Nanoid.generate(size: 8)
    @itinerary_handler.copy_itinerary(code, new_code)
    session[:success] = "You've made a copy of itinerary #{code}."
    redirect "/itinerary/#{new_code}"
  rescue InvalidItineraryCodeError => e
    session[:error] = e.message
    redirect "/"
  end
end

# Add experience to destination
post "/itinerary/:code/destinations/:id/experiences" do
  code = validate_itinerary_code(params[:code])
  destination_id = params[:id].to_i
  text = params[:text].strip

  error = error_for_experience_text(text)
  if error
    session[:error] = error
  else
    @itinerary_handler.add_experience(destination_id, text)
    session[:success] = "The experience has been added."
  end

  redirect "/itinerary/#{code}"
end

# Delete experience from destination
post "/itinerary/:code/destinations/:id/experiences/:experience_id" do
  code = validate_itinerary_code(params[:code])
  experience_id = params[:experience_id].to_i
  @itinerary_handler.delete_experience(experience_id)
  session[:success] = "The experience has been deleted."

  redirect "/itinerary/#{code}"
end

get "/itinerary/:code/sharing" do
  code = validate_itinerary_code(params[:code])
  @itinerary = @itinerary_handler.find_itinerary_by_code(code)

  erb :sharing, layout: :layout
end

get "/faq" do
  erb :faq, layout: :layout
end

not_found do
  redirect "/"
end
