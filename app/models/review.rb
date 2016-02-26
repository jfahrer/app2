class Review < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  validates :stars, presence: true
end
