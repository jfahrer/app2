json.array! @matches do |match|
  json.partial! 'details', match: match
end
