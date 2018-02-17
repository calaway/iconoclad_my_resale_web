require 'rails_helper'

RSpec.feature 'User visits upload page', type: :feature do
  context 'is not an admin' do
    scenario 'redirected to home' do
      user = User.create(name: 'test', myresaleweb_id: 'no', myresaleweb_last_name: 'yeah')
      stub_login(user)

      visit('/admin/uploads/new')

      expect(current_path).to eq('/')
    end
  end

  context 'is an admin' do
    before do
      admin = User.create(name: 'test', admin: 1)
      stub_login(admin)
    end

    scenario 'sees admin inventory new page' do
      visit('/admin/uploads/new')

      expect(current_path).to eq('/admin/uploads/new')
    end

    scenario 'uploaded file successfully' do
      visit('/admin/uploads/new')
      attach_file('inventory_file', 'spec/fixtures/consign.mdb')

      expect(current_path).to eq('/admin/uploads/new')
    end

    scenario 'wrong file type' do
    end
  end
end
