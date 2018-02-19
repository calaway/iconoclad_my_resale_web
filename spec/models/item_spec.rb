require 'rails_helper'

describe Item, type: :model do
  before do
    consign_mdb = Mdb.open('spec/fixtures/consign.mdb')
    described_class.import(consign_mdb[:Merchandise])
  end

  it '.import' do
    expect(described_class.count).to eq(64879)
  end
end
