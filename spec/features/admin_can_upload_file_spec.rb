require 'rails_helper'

RSpec.feature 'User visits upload page', type: :feature do
  context 'is not an admin' do
    scenario 'redirected to home' do
      user = User.create(name: 'test', myresaleweb_id: 'no', myresaleweb_last_name: 'yeah')
      stub_login(user)

      visit('/admin')

      expect(current_path).to eq('/')
    end
  end

  context 'is an admin' do
    before do
      admin = User.create(name: 'test', admin: 1)
      stub_login(admin)
    end

    scenario 'sees admin inventory new page' do
      visit('/admin/inventory/new')

      expect(current_path).to eq('/admin/inventory/new')
    end

    scenario 'uploaded file successfully' do
      visit('/admin')
      attach_file('inventory_file', 'spec/fixtures/inventory.csv')

      expect(current_path).to eq('/admin/')
    end

    scenario 'wrong file type' do
    end
  end
end
