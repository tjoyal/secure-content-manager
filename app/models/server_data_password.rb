class ServerDataPassword < ActiveRecord::Base

  attr_accessible :name, :username, :password, :note

  attr_encrypted :password, :key => Settings.encrypt_key

  belongs_to :server

end
