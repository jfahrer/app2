json.name @event.name
json.description @event.description
json.category @event.category
json.distance 0
json.latitude @event.latitude
json.longitude @event.longitude
json.time @event.time
json.been_there @event.been_there
json.host do |json|
  json.name @event.user.name
  json.id @event.user.id
end
