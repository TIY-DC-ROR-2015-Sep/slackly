class AuthController < Devise::OmniauthCallbacksController
  def slack
    auth = request.env["omniauth.auth"]
    user = User.from_omniauth auth
    sign_in user
    redirect_to "/tiy_dc2015_rails"
  end
end
