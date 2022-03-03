class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_one :evaluation
  has_one :review
  validates :vehicle_address, presence: true
  validates :state, presence: true, inclusion: { in: (-1..1) }
end
