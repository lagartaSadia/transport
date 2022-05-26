class DeliveryTime < ApplicationRecord
  belongs_to :carrier

  validates :first_distance, :second_distance, :time, presence: true
  validates :first_distance, :second_distance, :time, numericality: { only_integer: true }
  validates :time, numericality: { greater_than: 0 }
end
