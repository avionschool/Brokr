class AddPurchasePriceToUserStocks < ActiveRecord::Migration[6.0]
  def change
    add_column :user_stocks, :purchase_price, :decimal
  end
end
