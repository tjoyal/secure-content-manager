class Group < ActiveRecord::Base
  attr_accessible :name

  has_many :servers, :dependent => :destroy
  has_many :user_groups, :dependent => :destroy

  accepts_nested_attributes_for :user_groups, :allow_destroy => true

  attr_accessible :user_groups_attributes

end
