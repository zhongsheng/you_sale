class CreateImports < ActiveRecord::Migration[6.0]
  def change
    create_table :imports do |t|
      t.string :name
      t.text :info

      t.timestamps
    end
  end
end
