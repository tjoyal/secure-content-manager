class ServersController < ApplicationController

  inherit_resources
  belongs_to :group

  load_and_authorize_resource :group
  load_and_authorize_resource :server, :through => :group_id

  def update
    super do |format|
      format.html {
        redirect_to group_server_path(resource.group_id, resource)
      }
    end
  end

  def destroy
    super do |format|
      format.html {
        if request.xhr?
          render :text => ''
        end
      }
    end
  end

end
