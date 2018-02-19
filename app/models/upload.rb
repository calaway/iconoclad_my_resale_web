class Upload < ApplicationRecord
  def self.import(consign_mdb)
    Customer.import(consign_mdb[:Customers])
    Product.import(consign_mdb[:Merchandise])
  end
end
