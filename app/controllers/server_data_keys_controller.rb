class ServerDataKeysController < ApplicationController

  inherit_resources
  belongs_to :group
  belongs_to :server

  custom_actions :resource => :private_key

  def private_key
    # todo : Log into audit
    render :text => resource.private_key
  end

end
