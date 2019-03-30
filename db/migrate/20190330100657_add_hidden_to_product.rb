class AddHiddenToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :hidden, :boolean, default: false
  end
end
