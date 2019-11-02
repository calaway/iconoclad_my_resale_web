require 'rails_helper'

describe Customer, type: :model do
  it { is_expected.to have_many(:products).dependent(:destroy) }

  it '.import' do
    consign_mdb = Mdb.open('spec/fixtures/consign_sample.mdb')
    described_class.import(consign_mdb[:Customers])
    calaway = described_class.find(706)

    expect(described_class.count).to eq(10)
    expect(calaway.id).to eq(706)
    expect(calaway.first_name).to eq('C')
    expect(calaway.last_name).to eq('Calaway')
    expect(calaway.account_balance).to eq(33.41)
    expect(calaway.active_items).to eq(10)
  end
end
