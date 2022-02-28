class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_many :bookings, dependent: :destroy
  has_many :evaluations, dependent: :destroy
  has_one :service, dependent: :destroy
end
