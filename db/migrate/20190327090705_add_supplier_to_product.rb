class AddSupplierToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :supplier, foreign_key: true
  end
end
