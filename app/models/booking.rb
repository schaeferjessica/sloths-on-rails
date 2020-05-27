class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sloth
  has_many :reviews, dependent: :destroy
  validates :start_date, :end_date, presence: true
  # will replace :total_cost and :status to validation later
end
