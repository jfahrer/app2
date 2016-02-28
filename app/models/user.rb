class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 17, integer_only: true }
  validates :sex, presence: true

  has_many :events

  before_create :setup_auth_token

  private

  def setup_auth_token
    begin
      self.auth_token = rand(36**12).to_s(36)
    end while User.exists?(auth_token: auth_token)
  end
end
