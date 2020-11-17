class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :conveyings, dependent: :destroy
  has_one_attached :photo
  has_many :bookings, through: :conveyings
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
