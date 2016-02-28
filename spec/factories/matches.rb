FactoryGirl.define do
  factory :match do
    association :user
    association :event
    status 0
  end
end
