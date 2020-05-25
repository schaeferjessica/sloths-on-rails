class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sloth
  has_many :reviews, dependent: :destroy
  validates :start_date, :end_date, :total_cost, :status, presence: true
end
