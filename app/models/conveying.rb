class Conveying < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :boat_name, presence: true, uniqueness: true
  validates :boat_type, presence: true
  validates :start_location, presence: true
  validates :arrival_location, presence: true
  validates :start_date, presence: true
  validates :arrival_date, presence: true
  validates :duration, presence: true
  validates :price, presence: true
  validates :capacity, presence: true
end
