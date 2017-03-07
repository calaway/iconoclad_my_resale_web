require 'rails_helper'

RSpec.feature "Visitor logs in with facebooks", type: :feature do
  scenario "they are taken to facebook to confirm" do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
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
    })

    visit root_path

    expect(current_path).to eq "/login"
    expect(User.count).to eq 0
    
    click_on "Log in with Facebook"

    expect(User.count).to eq 0
  end
end
