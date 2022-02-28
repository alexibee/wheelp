class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :vehicle_address, presence: true
end
