class Service < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  has_many :reviews, through: :bookings
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
end
