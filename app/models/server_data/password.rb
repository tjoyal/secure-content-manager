class ServerData::Password < ActiveRecord::Base

  include ServerData

  set_table_name :server_data_passwords

  attr_accessible :name, :username, :password, :note

  attr_encrypted :password, :key => Settings.encrypt_key

  belongs_to :server

end
