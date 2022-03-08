class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_one :evaluation, dependent: :destroy
  has_one :review, dependent: :destroy
  has_one :chatroom, dependent: :destroy
  validates :vehicle_address, presence: true
  validates :state, presence: true, inclusion: { in: (-1..1) }
  validate :cant_book_your_own
  geocoded_by :vehicle_address
  after_validation :geocode, if: :will_save_change_to_vehicle_address?

  def cant_book_your_own
    errors.add("You can't book your own services") if user_id == service[:user_id]
  end
end
