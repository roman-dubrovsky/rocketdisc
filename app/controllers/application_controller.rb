class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :set_locale

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:name]
    end

    def user_not_authorized!
      flash[:alert] = t('errors.not_authorized')
      redirect_to :back

      rescue ActionController::RedirectBackError
      redirect_to root_path
    end

    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
end
