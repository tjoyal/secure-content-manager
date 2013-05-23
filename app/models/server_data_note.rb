class ServerDataNote < ActiveRecord::Base
  attr_accessible :name, :note

  belongs_to :server

end
