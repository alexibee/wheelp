class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :booking
  has_one_attached :video
  has_one_attached :document
  has_one_attached :photo
end
