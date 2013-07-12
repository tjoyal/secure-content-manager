class SetupController < ApplicationController

  skip_before_filter :initial_setup
  skip_before_filter :ensure_encrypt_key
  skip_before_filter :authenticate_or_token

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
        add_flash_now :error, e.message
      end

    end

  end

  def encrypt_key

    if Setting.find_by_name(:setup_encrypt_key)
      raise 'Encrypt key already set'
    end

    if Settings.encrypt_key.present?
      raiser 'Error: An encrypt key is already present but your database is still in it initial setup process. Remove the old key to continue (config/settings.local.yml).'
    end

    encrypt_key = nil
    if params[:encrypt_key] && params[:encrypt_key][:key]
      encrypt_key = params[:encrypt_key][:key]
    end

    if encrypt_key

      minimum_length = 8

      if encrypt_key.length < minimum_length
        add_flash_now :error, "Your encrypt key must be at lease #{minimum_length} characters long"
        return
      end

      # Load yaml
      filename = Rails.root.join('config', 'settings.local.yml')
      if File.exist?(filename)
        settings = YAML.load_file(filename) || {}
        settings['encrypt_key'] = encrypt_key
      else
        settings = {}
      end

      File.write(filename, settings.to_yaml)
      Settings.reload!

      setting = Setting.find_or_create_by_name(:setup_encrypt_key)
      setting.value = 'ok'
      setting.save!

      redirect_to root_path
    end

  end

end
