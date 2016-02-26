require 'rails_helper'

RSpec.describe "Matches", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:headers) {
    { 'Auth-Token' =>  user.auth_token }
  }

  it 'lists all the unansered matches for an event' do
    event = FactoryGirl.create(:event)
    match1, match2, match3, match4 = FactoryGirl.create_list(:match, 4, event: event)
    match1.declined!
    match2.declined!
    get "/events/#{event.id}/matches", { format: :json }, headers
    expect(JSON.parse(response.body).size).to eq(2)
  end

  it 'creates a new match for an event' do
    event = FactoryGirl.create(:event)
    expect {
      post "/events/#{event.id}/matches", { format: :json }, headers
    }.to change { event.matches.count }.by(1)
  end

  it 'updates a match' do
    event = FactoryGirl.create(:event)
    match = FactoryGirl.create(:match, event: event)
    expect {
      put "/events/#{event.id}/matches/#{match.id}", { format: :json, match: "decline" }, headers
    }.to change { match.reload.status }.to "declined"
    expect {
      put "/events/#{event.id}/matches/#{match.id}", { format: :json, match: "accept" }, headers
    }.to change { match.reload.status }.to "accepted"
  end
end
