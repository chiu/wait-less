# class ApplicationController < ActionController::Base
#   # Prevent CSRF attacks by raising an exception.
#   # For APIs, you may want to use :null_session instead.
#   protect_from_forgery with: :exception
# end


class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) << :role
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation) }
    end

    # def current_user
    #     @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # end

    # helper_method :current_user
end