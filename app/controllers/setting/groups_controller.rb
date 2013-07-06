class Setting::GroupsController < ApplicationController

  inherit_resources

  load_and_authorize_resource :group

  def create
    super do |format|
      format.html { redirect_to collection_path }
    end
  end

end
