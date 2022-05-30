class Order < ApplicationRecord
  include TranslateEnum
  
  enum status: { pending: 0, accepted: 1, rejected: 2, delivered: 3 }
  translate_enum :status

  belongs_to :carrier
  belongs_to :vehicle, optional: true

  before_create :generate_code
  before_create :set_status_default

  private 

  def generate_code
    if self.code == nil
      self.code = SecureRandom.alphanumeric(15).upcase
    end
  end

  def set_status_default
    self.status = 0
  end
end
