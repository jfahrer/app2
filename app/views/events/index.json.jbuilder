json.array! @events do |event|
  json.name event.name
  json.category event.category
  json.distance 0
  json.latitude event.latitude
  json.longitude event.longitude
  json.time event.time
  json.been_there event.been_there
end
