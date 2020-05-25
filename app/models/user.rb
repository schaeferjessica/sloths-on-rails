class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sloths, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, :through => :bookings, dependent: :destroy
  validates :username, :first_name, :last_name, :email, presence: true
  validates :username, :email, uniqueness: true
end
