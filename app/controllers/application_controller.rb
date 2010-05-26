# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :authenticate, :set_locale

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
private
  def authenticate
    return unless ENV["DENY_PUBLIC_ACCESS"]
    
    unless session[:user]
      authenticate_or_request_with_http_basic do |id, password|
        if (id == ENV["HTTP_USER"]) && (password == ENV["HTTP_PASSWORD"])
          session[:user] = id
        end
      end
    end
  end
  
  def set_locale
    locale = params[:locale] if params[:locale] && I18n.available_locales.member?(params[:locale].to_sym)
    I18n.locale = locale || session[:locale] || 'en'
    session[:locale] = I18n.locale
  end
  
end
