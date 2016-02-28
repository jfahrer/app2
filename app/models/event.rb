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
  validates :category, presence: true
  validates :time, presence: true

  acts_as_mappable default_units: :miles, 
    lat_column_name: :latitude, lng_column_name: :longitude
end