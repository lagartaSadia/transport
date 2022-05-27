class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: [:user, :admin]

  after_initialize :set_default_role, :if => :new_record?
  after_create :set_carrier

  def set_default_role
    if (email.split('@')[1] == 'sistemadefrete.com.br')
      self.role ||= :admin
    else
      self.role ||= :user
    end
  end

  private

  def set_carrier
    @carrier = Carrier.where('domain = ?', self.email.split('@')[1])
    if @carrier.present?
      self.carrier_id = @carrier[0].id
      self.save!
    end
  end
end
