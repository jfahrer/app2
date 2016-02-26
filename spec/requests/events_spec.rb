require 'rails_helper'

RSpec.describe "Event querying" do
  let(:user) { FactoryGirl.create(:user) }
  let(:headers) {
    { 'Auth-Token' =>  user.auth_token }
  }

  it 'returns a list of events in json' do
    FactoryGirl.create_list(:event, 2, longitude: 50, latitude: 50)
    get '/events', { format: :json, filters: { latitude: 50, longitude: 50, distance: 50 } }, headers
    expect(JSON.parse(response.body).size).to eq(2)
  end

  it 'displays an event' do
    event = FactoryGirl.create(:event)
    get "/events/#{event.id}", { format: :json }, headers
    data = JSON.parse(response.body)
    expect(data["name"]).to eq(event.name)
    expect(data["host"]["name"]).to eq(event.user.name)
  end

  it 'creates an event' do
    FactoryGirl.create(:user)
    data = {
      name: 'Karaoke Night', location: 'The Bar', longitude: 55, latitude: 44, 
      description: 'Let us dance al night!', price: 1, been_there: true,
      category: 'entertainment', time: Time.now + 1.hour
    }
    expect {
      post '/events', { format: :json, event: data }, headers
    }.to change{Event.count}.by 1
  end
end
