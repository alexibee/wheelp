class Evaluation < ApplicationRecord
  belongs_to :user
  has_one_attached :video
  has_one_attached :document
  has_one_attached :photo
end
