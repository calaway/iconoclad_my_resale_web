require 'rails_helper'

feature 'Admin logs in via Facebook', type: :feature do
  before :each do
    OmniAuth.config.mock_auth[:facebook] = nil
  end

  context 'when user is an admin' do
    let(:admin_from_facebook) do
      {
        'provider' => 'facebook',
        'uid' => '12345678901234567',
        'info' => {
          'name' => 'Christopher Calaway'
        },
        'credentials' => {
          'token' => 'xxxxxx',
          'expires_at' => 1_493_955_507,
          'expires' => true
        }
      }
    end

    scenario 'they can navigate to the admin dashboard' do
      omniauth_facebook_mock_success(admin_from_facebook)

      visit root_path
      click_on 'Log in with Facebook'

      current_user = User.find_by(uid: admin_from_facebook['uid'])
      expect(current_user.admin?).to be(true)

      click_on 'Admin Dashboard'
      expect(current_path).to eq '/admin/uploads/new'
    end
  end

  context 'when user is not an admin' do
    let(:admin_from_facebook) do
      {
        'provider' => 'facebook',
        'uid' => '00000000000000001',
        'info' => {
          'name' => 'Arthur Dent'
        },
        'credentials' => {
          'token' => 'xxxxxx',
          'expires_at' => 1_493_955_507,
          'expires' => true
        }
      }
    end

    scenario 'they cannot navigate to the admin dashboard' do
      omniauth_facebook_mock_success(admin_from_facebook)

      visit root_path
      click_on 'Log in with Facebook'

      current_user = User.find_by(uid: admin_from_facebook['uid'])
      expect(current_user.admin?).to be(false)

      expect(has_link?('Admin Dashboard')).to be(false)
      expect(current_path).to eq root_path
    end
  end
end
