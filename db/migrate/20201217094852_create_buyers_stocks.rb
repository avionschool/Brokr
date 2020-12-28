class CreateBuyersStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers_stocks do |t|
      t.integer :user_id
      t.integer :transaction_id
      t.integer :stock_id


      t.timestamps
    end
  end
end
