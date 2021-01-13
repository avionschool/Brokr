class UserStock < ApplicationRecord

  # validates :stock_id, presence: true, uniqueness: true

  belongs_to :user
  belongs_to :stock
end
