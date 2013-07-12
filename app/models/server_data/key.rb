class ServerData::Key < ActiveRecord::Base

  include ServerData

  self.table_name = :server_data_keys

  attr_accessible :name, :private_key, :public_key, :note

  attr_encrypted :private_key, :key => Settings.encrypt_key

  belongs_to :server

end
