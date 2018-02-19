class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :customer, foreign_key: true
      t.string :product_type
      t.string :color
      t.string :size
      t.string :description
      t.float :original_price
      t.float :price
      t.date :enter_date
      t.date :expire_date
      t.integer :item_count
      t.string :status

      t.timestamps
    end
  end
end
