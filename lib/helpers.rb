# Input Validation
def error_for_itinerary_name(name)
  "Name must be between 1 and 100 characters." unless (1..100).cover? name.size
end

def error_for_experience_text(text)
  "Text must be between 1 and 100 characters." unless (1..100).cover? text.size
end
