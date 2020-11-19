class Conveying < ApplicationRecord
  BOATTYPES = ['Sailboat', 'Motorboat', 'Yacht']
  CAPACITIES = ['1', '2', '3', '4', '5', '6+']
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :boat_name, presence: true
  validates :boat_type, inclusion: { in: BOATTYPES }
  validates :start_location, presence: true
  validates :arrival_location, presence: true
  validates :start_date, presence: true
  validates :arrival_date, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to:  0 }
  validates :capacity, inclusion: { in: CAPACITIES }
  geocoded_by :start_location
  after_validation :geocode, if: :will_save_change_to_start_location?
end
