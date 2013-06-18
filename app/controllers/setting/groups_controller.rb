class Setting::GroupsController < ApplicationController

  inherit_resources

  load_and_authorize_resource :group

end
