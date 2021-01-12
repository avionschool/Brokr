class Transaction < ApplicationRecord

    validates :broker_id, presence: true
    validates :buyer_id, presence: true
    validates :stock_id, presence: true

    belongs_to :user
    belongs_to :stock
end
