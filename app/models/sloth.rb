class Sloth < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, :through => :bookings, dependent: :destroy
  validates :name, :address, :price, presence: true
  has_one_attached :photo
  # has_many_attached :photos
end
