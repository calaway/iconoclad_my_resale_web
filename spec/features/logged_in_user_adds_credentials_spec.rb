require 'rails_helper'

RSpec.feature 'Visitor adds myresaleweb credentials', type: :feature do
  context 'We do not have user credentials for this user' do
    scenario 'User entered correct credentials' do
      user = User.create(name: 'test')
      stub_login(user)
      visit root_path

      expect(current_path).to eq '/credentials'

      fill_in('user_myresaleweb_id', with: ENV['MY_RESALE_WEB_ID_1'])
      fill_in('user_myresaleweb_last_name', with: ENV['MY_RESALE_WEB_NAME_1'])

      click_on 'Submit'

      expect(user.myresaleweb_id).to eq ENV['MY_RESALE_WEB_ID_1']
      expect(user.myresaleweb_last_name).to eq ENV['MY_RESALE_WEB_NAME_1']

      expect(current_path).to eq root_path
    end

    scenario 'User has entered incorrect credentials' do
    end
  end

  scenario 'We do have credentials for this user' do
  end
end
