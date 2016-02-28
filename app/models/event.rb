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

  has_many :matches

  acts_as_mappable default_units: :miles, 
    lat_column_name: :latitude, lng_column_name: :longitude

  enum status: [:open, :accepted]

  def distance(lat, lng)
    return 0 if lat.blank? or lng.blank?
    Geocoder::Calculations.distance_between([latitude, longitude], [lat, lng])
  end

  def uber_price_estimate(slat, slng)
    return 0 if slat.blank? or slng.blank?

    client = Uber::Client.new do |config|
      config.server_token  = "FPD_gvNtB-ow-7KIseaf4iGp7J92027vKhKS9Zqg"
      config.client_id     = "irCI3msdUZcgGwjAGHzgz8DYxcPwTn89"
      config.client_secret = "FLQYZsNMUkc13Mb-2Wdx2689WTIj3_wFyWCpltLw"
      # config.bearer_token  = "USER_ACCESS_TOKEN"
    end

    price = client.price_estimations(start_latitude: slat, start_longitude:  slng,
                                     end_latitude: self.latitude, end_longitude: self.longitude)
    price.first.estimate

  end
end
