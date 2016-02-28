require 'rails_helper'

RSpec.describe Match, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:match)).to be_valid
    expect{ FactoryGirl.create_list(:match, 10) }.to change{ Match.count }.by(10)
  end

  it { should validate_presence_of :user }
  it { should validate_presence_of :event }
end
