class Price < ApplicationRecord
  belongs_to :carrier
  FEE_REGEXP = /\A\d+(?:\.\d{0,2})?\z/.freeze
  DIMENSION_REGEXP = /\A\d+.\d{0,3}\Z/.freeze

  validates :first_dimension, :second_dimension, :first_weight, :second_weight, :fee, :minimal_fee, presence: true

  validates :first_dimension, :second_dimension, :first_weight, :second_weight, numericality: { greater_than_or_equal_to: 0 }

  validates :second_dimension, numericality: { greater_than: :first_dimension}

  validates :second_weight, numericality: { greater_than: :first_weight}


  validates :fee, :minimal_fee, numericality: { greater_than: 0 }

  validates :first_dimension, :second_dimension, :first_weight, :second_weight, format: { with: DIMENSION_REGEXP }

  validates :fee, :minimal_fee, format: { with: FEE_REGEXP }
end
