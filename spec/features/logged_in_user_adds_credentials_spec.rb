require 'rails_helper'

RSpec.feature 'Visitor adds myresaleweb credentials', type: :feature do
  context 'We do not have user credentials for this user' do
    scenario 'User entered correct credentials' do

      # As a user, who is already logged in, when I visit the root path
      user = User.create(name: 'test')
      stub_login(user)
      visit root_path

      # Should expect to be on the user show page
      expect(current_path).to eq '/credentials'

      # Enter MRW credentials
      fill_in('myresaleweb_id', with: ENV['MY_RESALE_WEB_ID_1'])
      fill_in('myresaleweb_last_name', with: ENV['MY_RESALE_WEB_NAME_1'])

      # Click submit
      click_on 'Submit'

      # Credentials are added to database
      expect(user.myresaleweb_id).to eq ENV['MY_RESALE_WEB_ID_1']
      expect(user.myresaleweb_last_name).to eq ENV['MY_RESALE_WEB_NAME_1']

      # Direct to root_path
      expect(current_path).to eq root_path

    end
    scenario 'User has entered incorrect credentials' do

    end

  end


  scenario 'We do have credentials for this user' do

  end
end
