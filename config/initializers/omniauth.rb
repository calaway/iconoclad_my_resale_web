Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
           ENV['FACEBOOK_KEY'],
           ENV['FACEBOOK_SECRET']

  on_failure do |env|
    # FIXME: This is not sending the error params through.
    # See https://github.com/omniauth/omniauth/issues/626#issuecomment-29770417
    SessionsController.action(:failure).call(env)
    # See https://github.com/omniauth/omniauth/wiki/FAQ#omniauthfailureendpoint-does-not-redirect-in-development-mode
    OmniAuth::FailureEndpoint.new(env).redirect_to_failure
  end
end
