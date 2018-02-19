require 'rails_helper'

feature 'Admin uploads mdb file', type: :feature do
  let(:admin) { User.create(name: 'Anorak', admin: true) }
  before do
    stub_login(admin)
  end

  scenario 'the records are loaded in the database' do
    visit new_admin_upload_path

    attach_file('Upload consign.mdb file', Rails.root.join('spec', 'fixtures', 'consign.mdb'))
    click_on('Submit')

    expect(Customer.count).to eq(3497)
    expect(Product.count).to eq(64_879)
    expect(Customer.find(706).last_name).to eq('Calaway')
    expect(Customer.find(10).products.count).to eq(178)
  end
end
