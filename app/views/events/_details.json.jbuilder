json.name event.name
json.description event.description
json.category event.category
json.distance event.distance(latitude, longitude)
json.latitude event.latitude
json.longitude event.longitude
json.time event.time
json.been_there event.been_there
json.status event.status
json.location event_path(event)
json.uber_price_estimate event.uber_price_estimate(latitude, longitude)
json.matches event_matches_path(event)
json.host do |json|
  json.partial! 'users/details', user: event.user
end
