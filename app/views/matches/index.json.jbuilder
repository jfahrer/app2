json.array! @matches do |match|
  json.id match.id
  json.user do
    json.partial! 'users/details', user: match.user
  end
end
