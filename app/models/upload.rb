class Upload < ApplicationRecord
  def self.import(consign_mdb)
    ActiveRecord::Base.transaction do
      customer_records = Customer.import(consign_mdb[:Customers])
      product_records = Product.import(consign_mdb[:Merchandise])
      records = [customer_records, product_records].flatten
      raise ActiveRecord::Rollback unless records.all? { |record| record.errors.empty? }
    end
  end
end
