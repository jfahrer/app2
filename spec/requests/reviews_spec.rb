require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  let(:user) { FactoryGirl.create(:user) }
  let(:headers) {
    { 'Auth-Token' =>  user.auth_token }
  }

  describe "GET /reviews" do
    it "works! (now write some real specs)" do
      get '/reviews', { format: :json }, headers
      expect(response).to have_http_status(200)
    end
  end
end
