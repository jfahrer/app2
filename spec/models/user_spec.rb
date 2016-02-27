require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
    expect{ FactoryGirl.create_list(:user, 10) }.to change { User.count }.by(10)
  end
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :age }
  it { should validate_presence_of :sex }
  it { should validate_numericality_of :age }
  it { should have_many :events }
end
