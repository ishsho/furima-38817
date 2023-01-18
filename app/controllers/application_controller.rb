class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?



  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'ishsho' && password == '1203'
    end
  end

  def configure_permitted_parameters
    binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name_japanese,
       :first_name_japanese, :family_name_katakana, :first_name_katakana, :birthday])
  end
end
