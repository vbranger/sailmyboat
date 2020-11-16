class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :conveyings
  has_many :bookings, through: :conveyings
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
