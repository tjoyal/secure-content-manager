class ServerData::NotesController < ServerDataController

  inherit_resources
  defaults :resource_class => ServerData::Note, :collection_name => 'server_data_notes', :instance_name => 'server_data_note'

  belongs_to :group
  belongs_to :server

end
