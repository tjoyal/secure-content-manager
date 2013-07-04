class ApplicationController < ActionController::Base
  protect_from_forgery

  # todo: Fix device integration
  # check_authorization

  before_filter :initial_setup
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

  def initial_setup
      unless Setting.find_by_name(:setup_initial_user)
        redirect_to initial_user_setup_path
      end
  end

  # Overwriting the sign_out redirect path method
  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    if request.xhr?
      render :text => exception
    else
      redirect_to main_app.root_url, :alert => exception.message
    end
  end
end
