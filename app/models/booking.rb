class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_one :evaluation
  validates :vehicle_address, presence: true
end
