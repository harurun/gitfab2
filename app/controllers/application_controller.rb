class ApplicationController < ActionController::Base
  include ErrorHandling
  handle_as_unauthorized CanCan::AccessDenied

  protect_from_forgery with: :exception

  before_action :verify_name

  private
  def verify_name
    if user_signed_in? && current_user.name.blank?
      redirect_to [:edit, current_user]
    end
  end

  def current_user
    if session[:su]
      User.find session[:su]
    else
      super
    end
  end
end
