class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :booking
  belongs_to :user
end
