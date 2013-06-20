class ServerData::Note < ActiveRecord::Base

  include ServerData

  set_table_name :server_data_notes

  attr_accessible :name, :note

  belongs_to :server

end
