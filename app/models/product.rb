class Product < ApplicationRecord
  belongs_to :customer

  def self.import(products)
    products.map do |product|
      create(id:             product[:ProductID],   customer_id: product[:CustomerID],
             product_type:   product[:ProductType], color:       product[:ProductColor],
             size:           product[:ProductSize], description: product[:ProductDescription],
             original_price: product[:OrigPrice],   price:       product[:Price],
             enter_date:     product[:EnterDate],   expire_date: product[:ExpireDate],
             item_count:     product[:ItemCount])
    end
  end
end
