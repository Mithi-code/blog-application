class ApplicationController < ActionController::Base
  include Response

  add_flash_types :success, :danger, :info, :warning

  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :photo, :bio, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :photo, :bio, :email, :password, :current_password)
    end
  end

  def authorize_request
    header = request.headers['Auth']
    header = header.split.last if header
    begin
      @decoded = JWT.decode(header, 'mithi')[0]
      @current_user = User.find(@decoded['id'])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { error: e.message }, status: :unauthorized
    end
  end
end
