class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 17, integer_only: true }
  validates :sex, presence: true

  has_many :events
end
