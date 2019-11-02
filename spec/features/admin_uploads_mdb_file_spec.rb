require 'rails_helper'

feature 'Admin uploads mdb file', type: :feature do
  let(:admin) { User.create(name: 'Anorak', admin: true) }
  before do
    stub_login(admin)
  end

  scenario 'old records are destroyed and new records are loaded in the database' do
    customer = Customer.create(first_name: 'C', last_name: 'Calaway')
    customer.products.create(product_type: 'shirt', description: 'Bad Religion t-shirt')
    expect(Customer.count).to eq(1)
    expect(Product.count).to eq(1)

    visit new_admin_upload_path
    attach_file('Upload consign.mdb file', 'spec/fixtures/consign_sample.mdb')
    click_on('Submit')

    expect(Customer.count).to eq(10)
    expect(Product.count).to eq(258)
    expect(Customer.find(706).last_name).to eq('Calaway')
    expect(Customer.find(10).products.count).to eq(178)

    expect(current_path).to eq(new_admin_upload_path)
    within '#flash-messages' do
      expect(page).to have_text "Success! You're the best!"
    end
  end
end
