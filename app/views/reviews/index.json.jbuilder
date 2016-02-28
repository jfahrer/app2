json.array!(@reviews) do |review|
  json.extract! review, :id, :event_id, :user_id, :stars, :comment
  json.url review_url(review, format: :json)
end
