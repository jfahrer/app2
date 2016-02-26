json.array! @events do |event|
  json.partial! 'details', event: event
end
