class Upload < ApplicationRecord
  def self.import(consign_mdb)
    ActiveRecord::Base.transaction do
      transaction_records = []

      transaction_records << Customer.destroy_all
      transaction_records << Product.destroy_all

      transaction_records << Customer.import(consign_mdb[:Customers])
      transaction_records << Product.import(consign_mdb[:Merchandise])

      @errors = transaction_records.flatten.map do |record|
        record.errors.full_messages
      end.uniq.flatten
      raise ActiveRecord::Rollback unless @errors.empty?
    end

    @errors
  end
end
