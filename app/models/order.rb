class Order < ApplicationRecord
  belongs_to :carrier
  belongs_to :vehicle
end
