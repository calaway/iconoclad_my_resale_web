class Customer < ApplicationRecord
  def self.import(customers)
    customers.each do |customer|
      Customer.create(customer_id:     customer[:CustomerID],
                      first_name:      customer[:FirstName],
                      last_name:       customer[:LastName],
                      account_balance: customer[:AccountBalance],
                      active_items:    customer[:ActiveItems])
    end
  end
end
