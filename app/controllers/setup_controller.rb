class SetupController < ApplicationController

  skip_before_filter :initial_setup
  skip_before_filter :authenticate_user!

  def initial_user

    if Setting.find_by_name(:setup_initial_user)
      raise 'Initial user already created'
    end

    if initial_user = params[:initial_user]

      initial_user.select!{|x| %w(email password password_confirmation).include?(x)}

      initial_user[:admin] = true

      begin
        User.create!(initial_user)

        setting = Setting.find_or_create_by_name(:setup_initial_user)
        setting.value = 'ok'
        setting.save!

        redirect_to root_path
      rescue Exception => e
        flash[:error] ||= []
        flash[:error] << e.message
      end

    end

  end

end
