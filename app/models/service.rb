class Service < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  has_many :reviews, through: :bookings
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  pg_search_scope :search_by_bio_and_title,
                  against: [:bio, :title], # add :city :category :brands_specialising_on
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
end
