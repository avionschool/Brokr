class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :role_id, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  before_validation :set_password

  def set_password
    self.password = '123456'
  end
  
  has_one :role
end
