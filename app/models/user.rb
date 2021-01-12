class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :role_id, presence: true

  # kinoment out ko muna tong status approved para makapasok yung broker sa page.
  # validates :status_approved, presence: true

  # User-Stock many-to-many association
  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  has_many :transactions
  has_many :stocks, through: :transactions
  
  # has_one :role
  
  before_validation :init_status_approved

  def init_status_approved
    # id:1 - admin 
    # id:2 - broker 
    # id:3 - buyer 
    if (self.role_id == 2)  
      self.status_approved = false
    elsif (self.role_id == 3 || self.role_id == 1)  
      self.status_approved = true
    end
  end

end
