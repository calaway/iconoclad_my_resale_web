def omniauth_facebook_mock
  OmniAuth.config.test_mode = true
  
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
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
end
