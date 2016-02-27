FactoryGirl.define do
  factory :user do
    sequence(:name) { |i| "name_#{i}" }
    sequence(:email) { |i| "name_{i}@app2.com" }
    age (18..99).to_a.sample
    sex ['m', 'f'].sample
  end
end
