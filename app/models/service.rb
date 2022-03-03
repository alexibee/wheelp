class Service < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  has_many :reviews, through: :bookings
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  pg_search_scope :search_by_bio,
                  against: [:bio], # add :city :category :brands_specialising_on
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
