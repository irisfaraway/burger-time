class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Use Single Sign-On
  before_filter CASClient::Frameworks::Rails::Filter

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end
end
