class ServerDataKey < ActiveRecord::Base

  attr_accessible :name, :private_key, :public_key

  attr_encrypted :private_key, :key => Settings.encrypt_key

  belongs_to :server

end
