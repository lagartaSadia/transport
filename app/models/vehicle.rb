class Vehicle < ApplicationRecord
  belongs_to :carrier

  validates :license_plate, :brand, :vehicle_type, :fabrication_date, :capacity, presence: true

  validates :license_plate, uniqueness: true
  validates :license_plate, length: { is: 7 }

  validates :fabrication_date, :capacity, numericality: { only_integer: true }
  validates :fabrication_date, length: { is: 4 }
end
