require 'rails_helper'

RSpec.feature "Visitor logs in with facebooks", type: :feature do
  context "and they approve the request" do
    scenario "the user is created and logged in" do
      from_facebook = {
        "provider"=>"facebook",
        "uid"=>"12345678901234567",
        "info"=>{
          "name"=>"Christopher Calaway",
          "image"=>"http://graph.facebook.com/v2.6/10154446829432039/picture"
        },
        "credentials"=>{
          "token"=>"xxxxxx",
          "expires_at"=>1493955507,
          "expires"=>true
        },
        "extra"=>{
          "raw_info"=>{
            "name"=>"Christopher Calaway",
            "id"=>"12345678901234567"
          }
        }
      }

      omniauth_facebook_mock_success(from_facebook)

      visit root_path

      expect(current_path).to eq "/login"
      expect(User.count).to eq 0

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
      omniauth_facebook_mock_failure(:access_denied)

      visit login_path
      click_on "Log in with Facebook"

      expect(current_path).to eq login_path
      expect(page).to_not have_text "Welcome, "
      within "#flash-messages" do
        expect(page).to have_text "Login Unsuccessful"
      end
      expect(User.count).to eq 0
    end
  end
end
