class ApplicationController < ActionController::Base
  protect_from_forgery

  # todo: Fix device integration
  # check_authorization

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
