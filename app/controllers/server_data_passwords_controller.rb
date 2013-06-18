class ServerDataPasswordsController < ApplicationController

  inherit_resources
  belongs_to :group
  belongs_to :server

  custom_actions :resource => :private_key

  def password
    # todo : Log into audit

    begin
      result = resource.password
      status = 200
    rescue OpenSSL::Cipher::CipherError => e
      result = "Error : #{e.class} (Unable to open encrypted data)"
      status = 500
    end

    render :text => result, :status => status
  end

end
