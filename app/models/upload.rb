class Upload < ApplicationRecord
  def self.import(consign_mdb)
    ActiveRecord::Base.transaction do
      customer_records = Customer.import(consign_mdb[:Customers])
      product_records = Product.import(consign_mdb[:Merchandise])
      @errors = [customer_records, product_records].flatten.map do |record|
        record.errors.full_messages
      end.uniq.flatten
      raise ActiveRecord::Rollback unless @errors.empty?
    end
    @errors
  end
end
