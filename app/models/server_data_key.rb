class ServerDataKey < ActiveRecord::Base
  attr_accessible :name, :private_key, :public_key

  belongs_to :server

end
