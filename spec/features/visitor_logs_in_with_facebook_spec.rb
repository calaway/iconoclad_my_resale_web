require 'rails_helper'

RSpec.feature "Visitor logs in with facebooks", type: :feature do
  scenario "they are taken to facebook to confirm" do
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
  end
end
