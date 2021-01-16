class Stock < ApplicationRecord
    validates :symbol, presence: true, uniqueness: true

    # User-Stock many-to-many association
    has_many :user_stocks
    has_many :users, through: :user_stocks

    # Transaction many-to-many association
    has_many :transactions
    has_many :users, through: :transactions
end