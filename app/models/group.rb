class Group < ActiveRecord::Base
  attr_accessible :name

  has_many :servers, :dependent => :destroy
end
