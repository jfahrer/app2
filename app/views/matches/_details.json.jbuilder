json.id match.id
json.status match.status
json.location event_match_path(@event, match)
json.user do
  json.partial! 'users/details', user: match.user
end
