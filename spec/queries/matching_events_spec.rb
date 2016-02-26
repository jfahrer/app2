require 'rails_helper'

RSpec.describe MatchingEvents do
  include ActiveSupport::Testing::TimeHelpers

  it 'returns only events withing a given range' do
    event1 = FactoryGirl.create(:event, latitude: 50, longitude: 50)
    event2 = FactoryGirl.create(:event, latitude: 99, longitude: -55)
    data = { latitude: 50, longitude: 50, distance: 5 }
    expect(MatchingEvents.call(data)).to eq([event1])
  end

  it 'only returns events that are not due' do
    travel_to Time.now - 3.5.hours do
      event1 = FactoryGirl.create(:event, latitude: 100, longitude: 50)
    end
    event2 = FactoryGirl.create(:event, latitude: 100, longitude: 50)
    data = { latitude: 100, longitude: 50, distance: 20 }
    expect(MatchingEvents.call(data)).to eq([event2])
  end

  context 'filters the events' do

    it 'by their price classification' do
      event1 = FactoryGirl.create(:event, latitude: 50, longitude: 50, price: 0)
      event2 = FactoryGirl.create(:event, latitude: 50, longitude: 50, price: 3)
      data = { latitude: 50, longitude: 50, distance: 5, price: 1 }
      expect(MatchingEvents.call(data)).to eq([event1])
    end

    it 'by their category' do
      event1 = FactoryGirl.create(:event, latitude: 50, longitude: 50, category: 'entertainment')
      event2 = FactoryGirl.create(:event, latitude: 50, longitude: 50, category: 'outdoors')
      data = { latitude: 50, longitude: 50, distance: 5, category: 'entertainment' }
      expect(MatchingEvents.call(data)).to eq([event1])
    end

    it 'by their start and end time' do
      event1 = FactoryGirl.create(:event, latitude: 50, longitude: 50, time: Time.now + 1.hour)
      event2 = FactoryGirl.create(:event, latitude: 50, longitude: 50, time: Time.now + 2.hour)
      event3 = FactoryGirl.create(:event, latitude: 50, longitude: 50, time: Time.now + 3.hour)
      data = { latitude: 50, longitude: 50, distance: 5, 
        starts_before: Time.now + 2.5.hours, starts_after: Time.now + 0.5.hour }
      expect(MatchingEvents.call(data)).to eq([event1, event2])
    end

    it 'by the sex of the host' do
      user1 = FactoryGirl.create(:user, sex: 'm')
      user2 = FactoryGirl.create(:user, sex: 'f')
      event1 = FactoryGirl.create(:event, latitude: 50, longitude: 50, user: user1)
      event2 = FactoryGirl.create(:event, latitude: 50, longitude: 50, user: user2)
      data = { latitude: 50, longitude: 50, distance: 5, sex: 'f' } 
      expect(MatchingEvents.call(data)).to eq([event2])
    end

    it 'by the age of the host' do
      user1 = FactoryGirl.create(:user, age: 33)
      user2 = FactoryGirl.create(:user, age: 27)
      user3 = FactoryGirl.create(:user, age: 18)
      event1 = FactoryGirl.create(:event, latitude: 50, longitude: 50, user: user1)
      event2 = FactoryGirl.create(:event, latitude: 50, longitude: 50, user: user2)
      event3 = FactoryGirl.create(:event, latitude: 50, longitude: 50, user: user3)
      data = { latitude: 50, longitude: 50, distance: 5, min_age: 20, max_age: 30} 
      expect(MatchingEvents.call(data)).to eq([event2])
    end

  end
end

