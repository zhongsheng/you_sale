class AddPublishedToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :published, :boolean, default: true
  end
end
