class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    @oauth_authentication = OauthAuthentication.from_omniauth(request.env['omniauth.auth'])

    sign_in_and_redirect(@oauth_authentication.user, event: :authentication)
  end
end
