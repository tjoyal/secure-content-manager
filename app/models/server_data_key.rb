class ServerDataKey < ActiveRecord::Base
  attr_accessible :note, :private_key, :public_key

  belongs_to :server

end
