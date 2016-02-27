class Event < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { integer_only: true,
    greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :location, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :user, presence: true

end
