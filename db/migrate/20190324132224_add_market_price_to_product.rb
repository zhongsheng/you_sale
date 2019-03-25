class AddMarketPriceToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :market_price, :float
    add_column :products, :wholesale_price, :float
  end
end
