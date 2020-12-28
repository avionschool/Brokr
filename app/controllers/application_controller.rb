class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def index
        render html: '', layout: true
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :role_id])
        devise_parameter_sanitizer.permit(:account_update, keys: [:email, :encrypted_password, :role_id])
    end
end
