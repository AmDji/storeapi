class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.integer :inventory_count
      t.boolean :availability

      t.timestamps
    end
  end
end
