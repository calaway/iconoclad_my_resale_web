def omniauth_facebook_mock_success(from_facebook)
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(from_facebook)
end

def omniauth_facebook_mock_failure(failure)
  OmniAuth.config.mock_auth[:facebook] = failure
end
