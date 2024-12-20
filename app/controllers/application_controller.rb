class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Add custom fields to the Devise User model
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :nome, :role, :telefone ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :nome, :role, :telefone ])
  end
end
