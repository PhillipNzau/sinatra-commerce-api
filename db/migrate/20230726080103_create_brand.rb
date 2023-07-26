class CreateBrand < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :description
      
      # Add other product attributes

      t.timestamps
    end
  end
end
