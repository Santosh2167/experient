class ApplicationController < ActionController::Base
    before_action :add_devise_params, if: :devise_controller?

    def add_devise_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name, :isSupplier?, :post_code, :avatar])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
    end
end
