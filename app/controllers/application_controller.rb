class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :html, :json

  def set_locale
    I18n.locale = params[:locale] ? params[:locale].to_sym : I18n.default_locale
    redirect_to root_path
  end

  rescue_from CanCan::AccessDenied do |exception|  
    flash[:error] = "Access denied!"  
    redirect_to root_url  
  end  
end
