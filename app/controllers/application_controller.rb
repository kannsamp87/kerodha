class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  private   
  def current_user   
    User.where(id: session[:user_id]).first   
  end   
  
  def default_url_options
    { locale: I18n.locale }
  end

  helper_method :current_user   
end
