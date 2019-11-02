require 'rails_helper'

describe Product, type: :model do
  it { is_expected.to belong_to(:customer) }

  it '.import' do
    consign_mdb = Mdb.open('spec/fixtures/consign_sample.mdb')
    Customer.import(consign_mdb[:Customers])
    described_class.import(consign_mdb[:Merchandise])
    jodi = Customer.find(10)

    expect(described_class.count).to eq(258)
    expect(jodi.products.count).to eq(178)
  end
end
