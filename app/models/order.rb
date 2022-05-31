class Order < ApplicationRecord
  include TranslateEnum

  belongs_to :carrier
  belongs_to :vehicle, optional: true

  before_create :generate_code
  before_create :set_status_default
  
  enum status: { pending: 0, accepted: 1, rejected: 2, delivered: 3 }
  translate_enum :status

  # ------ VALIDAÇÕES --------

  validates :vendor_address, :item_code, :item_dimension, :item_weight, :client_address, :client_information, presence: true

  validates :vehicle_id, :update_address, presence: true, on: :update, if: -> {status == 1}

  validates :code, uniqueness: true

  validates :item_dimension, :item_weight, numericality: { greater_than: 0 }
  
  # --------------------------

  private 

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end

  def set_status_default
    self.status = 0
  end
end
