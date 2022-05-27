class Carrier < ApplicationRecord
    enum status: { active: 0, inactive: 1 }

    has_many :prices
    has_many :delivery_times

    validates :corporate_name, :brand_name, :domain, :registered_number, :full_address, presence: true
    validates :registered_number, length: { is: 14 }
    validates :corporate_name, :domain, :registered_number, uniqueness: true
end