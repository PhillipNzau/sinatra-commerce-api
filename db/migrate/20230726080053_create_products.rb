class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.text :description
      t.text :img
      t.integer :brand_id
      t.integer :category_id
      # Add other product attributes

      t.timestamps
    end
  end
end
