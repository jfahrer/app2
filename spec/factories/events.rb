FactoryGirl.define do
  factory :event do
    sequence(:name) { |i| "name_#{i}" }
    description "Sample description"
    price (0..5).to_a.sample
    location "Some location"
    latitude (0..100).to_a.sample
    longitude (0..100).to_a.sample
    association(:user)
    category "entertainment"
  end
end
