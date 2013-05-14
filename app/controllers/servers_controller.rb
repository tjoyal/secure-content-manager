class ServersController < ApplicationController

  inherit_resources

  belongs_to :groups, :optional => true

end
