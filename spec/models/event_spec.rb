require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.create(:event)).to be_valid
    expect{ FactoryGirl.create_list(:event, 10) }.to change { Event.count }.by(10)
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should validate_numericality_of :price }
  it { should validate_presence_of :location }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }
  it { should validate_presence_of :user }
end
