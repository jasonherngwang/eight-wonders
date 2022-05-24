require "simplecov"
SimpleCov.start

ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require "rack/test"

require_relative "../app"
require_relative "../lib/shortest_path_algos"

class RoutingTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    @itinerary_handler = ItineraryHandler.new
    @itinerary_handler.delete_all_data

    # Test Data
    @itinerary_handler.create_itinerary("itin0001")
    @itinerary_handler.update_itinerary_name("itin0001", "My Adventure")
    @itinerary_handler.add_destination("itin0001", "LAX")
    @itinerary_handler.add_experience(1, "Eat tacos.")
    @itinerary = @itinerary_handler.find_itinerary_by_code("itin0001")
  end

  def teardown
    @itinerary_handler.delete_all_data
  end

  def session
    last_request.env["rack.session"]
  end

  def test_index
    get "/"

    assert_equal 200, last_response.status
  end

  def test_create_new_itinerary
    get "/itinerary/new"

    assert_equal 302, last_response.status
    get last_response["Location"]

    assert_includes last_response.body, "Travel Itinerary"
  end

  def test_retrieve_existing_itinerary
    get "/itinerary/retrieve", { code: "itin0001" }

    assert_equal 302, last_response.status
    get last_response["Location"]

    assert_includes last_response.body, "My Adventure"
    assert_includes last_response.body, "Itinerary itin0001 has been retrieved."
  end

  def test_display_itinerary
    get "/itinerary/itin0001"

    assert_equal 200, last_response.status
    assert_includes last_response.body, "My Adventure"
    assert_includes last_response.body, "LAX"
    assert_includes last_response.body, "Eat tacos"
  end

  def test_invalid_itinerary_code
    get "/itinerary/invalidcode999"

    assert_equal 302, last_response.status
    get last_response["Location"]

    expected = "Itinerary with code invalidcode999 does not exist."
    assert_includes last_response.body, expected
  end

  def test_delete_itinerary
    post "/itinerary/itin0001/delete"

    assert_equal 302, last_response.status
    get last_response["Location"]

    expected = "Itinerary itin0001 has been deleted."
    assert_includes last_response.body, expected
  end

  def test_render_form_edit_itinerary_name
    get "/itinerary/itin0001/edit"

    assert_equal 200, last_response.status

    assert_includes last_response.body, "Rename Your Itinerary"
  end

  def test_edit_itinerary_name
    post "/itinerary/itin0001", { name: "My Excellent Adventure" }

    assert_equal 302, last_response.status
    get last_response["Location"]

    assert_includes last_response.body, "My Excellent Adventure"
  end

  def test_edit_itinerary_name_error
    post "/itinerary/itin0001", { name: "" }

    assert_equal 422, last_response.status

    expected = "Name must be between 1 and 100 characters."
    assert_includes last_response.body, expected
  end

  def test_copy_itinerary
    post "/itinerary/itin0001/copy"
    
    assert_equal 302, last_response.status
    get last_response["Location"]
    
    expected = "You've made a copy of itinerary itin0001."
    assert_includes last_response.body, expected
    refute_includes last_response.body, "ITINERARY CODE: itin0001"
  end
  
  def test_copy_itinerary_invalid_code
    post "/itinerary/itin0008/copy"
    
    assert_equal 302, last_response.status
    get last_response["Location"]
    
    expected = "Itinerary with code itin0008 does not exist."
    assert_includes last_response.body, expected
  end

  def test_share_itinerary
    get "/itinerary/itin0001/sharing"

    assert_equal 200, last_response.status

    assert_includes last_response.body, "Take a Screenshot"
    assert_includes last_response.body, "itin0001"
    assert_includes last_response.body, "Los Angeles"
    assert_includes last_response.body, "<p>CODE: itin0001</p>"
  end

  def test_toggle_sharing_code
    post "/itinerary/itin0001/sharing", { display_sharing_code: "hide" }

    assert_equal 302, last_response.status
    get last_response["Location"]

    assert_equal false, session[:display_sharing_code]
    refute_includes last_response.body, "<p>CODE: itin0001</p>"
  end

  def test_add_destination
    post "/itinerary/itin0001/destinations", { iata: "HKG" }

    assert_equal 302, last_response.status
    get last_response["Location"]

    expected = "Airport HKG has been added to your itinerary."
    assert_includes last_response.body, expected
    assert_includes last_response.body, "Hong Kong"
  end

  def test_add_destination_invalid_input
    post "/itinerary/itin0001/destinations", { iata: "YOLO" }

    assert_equal 302, last_response.status
    get last_response["Location"]

    expected = "Please enter a valid 3-letter IATA code."
    assert_includes last_response.body, expected
  end

  def test_add_destination_duplicate_input
    post "/itinerary/itin0001/destinations", { iata: "LAX" }

    assert_equal 302, last_response.status
    get last_response["Location"]

    expected = "Airport LAX is already in your itinerary."
    assert_includes last_response.body, expected
  end

  def test_delete_destination
    post "/itinerary/itin0001/destinations/1/delete"

    assert_equal 302, last_response.status
    get last_response["Location"]

    assert_includes last_response.body, "Destination has been deleted."
  end

  def test_randomize_itinerary
    post "/itinerary/itin0001/randomize"

    assert_equal 302, last_response.status
    get last_response["Location"]

    expected = "You've selected all 8 destinations, "\
               "so your itinerary is complete!"
    assert_includes last_response.body, expected
  end

  def test_add_experience
    post "/itinerary/itin0001/destinations/1/experiences",
         { text: "Relax on the beach." }

    assert_equal 302, last_response.status
    get last_response["Location"]

    assert_includes last_response.body, "Relax on the beach."
  end

  def test_add_experience_invalid_input
    post "/itinerary/itin0001/destinations/1/experiences", { text: "" }

    assert_equal 302, last_response.status
    get last_response["Location"]

    expected = "Text must be between 1 and 100 characters."
    assert_includes last_response.body, expected
  end

  def test_delete_experience
    post "/itinerary/itin0001/destinations/1/experiences/1"

    assert_equal 302, last_response.status
    get last_response["Location"]

    assert_includes last_response.body, "The experience has been deleted."
  end

  def test_faq
    get "/faq"

    assert_equal 200, last_response.status

    assert_includes last_response.body, "Frequently Asked Questions"
  end

  def test_not_found
    get "/tacos"

    assert_equal 302, last_response.status
    get last_response["Location"]

    assert_includes last_response.body, "round-the-world"
  end
  
  def test_sort_tsp_dp
    coords = [
      # Correct order
      # [33.942501,   -118.407997],    # LAX
      # [34.78549957,  135.4380035],   # ITM
      # [22.308901,    113.915001],    # HKG
      # [55.61790085,   12.65600014],  # CPH
      # [51.4706,       -0.461941],    # LHR
      # [49.012798,      2.55],        # CDG
      # [43.356499,     -1.79061],     # EAS
      # [40.639801,    -73.7789]       # JFK

      # Incorrect order, and expected index mapping
      [33.942501,   -118.407997],   # LAX 0 => 0
      [40.639801,    -73.7789],     # JFK 7 => 1
      [55.61790085,   12.65600014], # CPH 3 => 2
      [49.012798,      2.55],       # CDG 5 => 3
      [22.308901,    113.915001],   # HKG 2 => 4
      [43.356499,     -1.79061],    # EAS 6 => 5
      [51.4706,       -0.461941],   # LHR 4 => 6
      [34.78549957,  135.4380035]   # ITM 1 => 7
    ]

    expected = { 0 => 0, 1 => 7, 2 => 3, 3 => 5,
                 4 => 2, 5 => 6, 6 => 4, 7 => 1 }
    assert_equal sort_tsp_dp(coords), expected
  end
end
