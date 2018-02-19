class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :product_id
      t.references :customer, foreign_key: true
      t.string :product_type
      t.string :product_color
      t.string :product_size
      t.string :product_description
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
