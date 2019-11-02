class Customer < ApplicationRecord
  has_many :products, dependent: :destroy

  def self.import(customers)
    customers.map do |customer|
      create(id:              customer[:CustomerID],
             first_name:      customer[:FirstName],
             last_name:       customer[:LastName],
             account_balance: customer[:AccountBalance],
             active_items:    customer[:ActiveItems])
    end
  end
end
