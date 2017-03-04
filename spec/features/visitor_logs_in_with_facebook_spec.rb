require 'rails_helper'

RSpec.feature "Visitor logs in with facebooks", type: :feature do
  # As a Visitor
  # When I visit "/"
  visit root_path
  # I should be at "/login"
  expect(page).to eq "/login"
  # When I click on "Log in with Facebook"
  click_on "Log in with Facebook"
  # I should land on "https://www.facebook.com/v2.8/dialog/oauth"
  expect(page).to eq "https://www.facebook.com/v2.8/dialog/oauth"
end
