require 'rails_helper'

RSpec.feature "Visitor logs in with facebooks", type: :feature do
  scenario "they are taken to facebook to confirm" do
    visit root_path

    expect(current_path).to eq "/login"
    expect(page).to have_link "Log in with Facebook"
  end
end
