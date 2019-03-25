class AddContryToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :contry, foreign_key: true
  end
end
