require 'rails_helper'

RSpec.describe "Event querying" do
  it 'returns a list of events in json' do
    FactoryGirl.create_list(:event, 2)
    get '/events', format: :json
    expect(JSON.parse(response.body).size).to eq(2)
  end
end
