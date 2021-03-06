class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    before_action :require_login
    
  private
    def not_authenticated
      redirect_to root_url, :notice => "First log in to view this page."
    end
  
end
