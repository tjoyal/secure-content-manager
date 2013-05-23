class ServerDataNotesController < ApplicationController

  inherit_resources
  belongs_to :group
  belongs_to :server

end
