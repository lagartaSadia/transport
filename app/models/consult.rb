class Consult < ApplicationRecord
    validates :item_dimension, :item_weight, :distance, presence: true

    validates :item_dimension, :item_weight, :distance, numericality: { greater_than: 0 }
end
