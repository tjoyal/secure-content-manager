class ServersController < ApplicationController

  inherit_resources

  belongs_to :group

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
