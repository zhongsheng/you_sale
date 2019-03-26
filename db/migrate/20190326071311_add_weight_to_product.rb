class AddWeightToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :weight, :string
    add_column :products, :specification, :string
    add_column :products, :shelf_life, :string
  end
end
