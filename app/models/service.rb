class Service < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  has_many :reviews, through: :bookings
  validates :user_id, uniqueness: true
  validates :title, presence: true
  validates :address, presence: true
  validates :price, presence: true
  CATEGORIES = ["Enthusiast", "Mechanic", "Technician", "Brand Expert"]
  validates :category, inclusion: { CATEGORIES }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  pg_search_scope :search_by_bio_title,
                  against: [:bio, :title], # add :city :category :brands_specialising_on
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }
  # pg_search_scope :search_by_address,
  #                 against: [:address],
  #                 using: {
  #                   tsearch: { prefix: true }
  #                 }

  def average_rating
    sum = 0
    count = 0
    self.reviews.each do |review|
      if review&.rating
        sum += review.rating
        count += 1
      end
    end
    (sum / count).to_f
  end

end
