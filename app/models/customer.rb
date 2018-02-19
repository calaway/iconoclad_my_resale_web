class Customer < ApplicationRecord
  has_many :products

  def self.import(customers)
    customers.each do |customer|
      create(id:              customer[:CustomerID],
             first_name:      customer[:FirstName],
             last_name:       customer[:LastName],
             account_balance: customer[:AccountBalance],
             active_items:    customer[:ActiveItems])
    end
  end
end
