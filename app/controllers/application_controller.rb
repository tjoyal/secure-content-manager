class ApplicationController < ActionController::Base
  protect_from_forgery

  # todo: Fix device integration
  # check_authorization

  before_filter :authenticate_user!

  # Validate Encrypt Key presence
  before_filter {
    if Settings.encrypt_key.empty?
      message = 'Encrypt key in your settings is undefined. Update with any private key of your own.'
      flash[:error] ||= []
      unless flash[:error].include?(message)
        flash[:error] << message
      end
    end
  }

  layout :select_layout

  def select_layout
    request.xhr? ? false : 'application'
  end

  before_filter :require_login

  def require_login
    unless current_user
      redirect_to new_user_session_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    if request.xhr?
      render :text => exception
    else
      redirect_to main_app.root_url, :alert => exception.message
    end
  end
end
