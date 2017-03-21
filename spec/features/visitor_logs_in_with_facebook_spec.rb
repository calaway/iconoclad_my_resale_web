require 'rails_helper'

RSpec.feature "Visitor logs in with facebooks", type: :feature do
  context "and they approve the request" do
    scenario "the user is created and logged in" do
      visit root_path

      expect(current_path).to eq "/login"
      expect(User.count).to eq 0

      omniauth_facebook_mock
      click_on "Log in with Facebook"

      expect(User.count).to eq 1
      user = User.last
      expect(user.provider).to eq "facebook"
      expect(user.uid).to eq "12345678901234567"
      expect(user.name).to eq "Christopher Calaway"
      expect(user.oauth_token).to eq "xxxxxx"
      expect(user.oauth_token_expires_at).to eq Time.at(1493955507)

      expect(current_path).to eq "/"
      expect(page).to have_text "Welcome, #{user.name}"
      within "#flash-messages" do
        expect(page).to have_text "Login Successful"
      end
    end
  end

  context "and they deny the request" do
    scenario "no user is created and they are redirected back to login again" do
      # As a visitor
      # when I visit the root path
      visit root_path
      # and I click log in with Facebook
      OmniAuth.config.mock_auth[:facebook] = :access_denied
      click_on "Log in with Facebook"
      # and I deny the request
      # then I am redirected back to the root path
      expect(current_path).to eq login_path
      # and I see a flash message saying "Login unsuccessful."
      expect(page).to_not have_text "Welcome, "
      within "#flash-messages" do
        expect(page).to have_text "Login Unsuccessful"
      end
      # And a user is not created
      expect(User.count).to eq 0
    end
  end
end
