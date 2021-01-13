class AddPurchasePriceToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :purchase_price, :decimal
  end
end
