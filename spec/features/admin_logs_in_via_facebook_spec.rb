require 'rails_helper'

RSpec.feature 'Admin logs in via Facebook', type: :feature do
  let(:from_facebook) do
    {
      'provider' => 'facebook',
      'uid' => '12345678901234567',
      'info' => {
        'name' => 'Christopher Calaway',
        'image' => 'http://graph.facebook.com/v2.6/10154446829432039/picture'
      },
      'credentials' => {
        'token' => 'xxxxxx',
        'expires_at' => 1_493_955_507,
        'expires' => true
      },
      'extra' => {
        'raw_info' => {
          'name' => 'Christopher Calaway',
          'id' => '12345678901234567'
        }
      }
    }
  end

  before :each do
    OmniAuth.config.mock_auth[:facebook] = nil
  end

  context 'and they approve the request' do
    scenario 'the user is created and logged in' do
      omniauth_facebook_mock_success(from_facebook)

      visit root_path
      click_on 'Log in with Facebook'

      current_user = User.find_by(uid: from_facebook['uid'])
      expect(current_user.admin?).to be(true)

      click_on 'Admin Dashboard'
      expect(current_path).to eq '/admin/uploads/new'
    end
  end
end
