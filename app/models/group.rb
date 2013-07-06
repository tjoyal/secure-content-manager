class Group < ActiveRecord::Base
  attr_accessible :name, :parent_id

  belongs_to :parent, :class_name => Group
  has_many :children, :class_name => Group, :foreign_key => :parent_id
  scope :root, where('parent_id is null')

  has_many :servers, :dependent => :destroy
  has_many :user_groups, :dependent => :destroy

  accepts_nested_attributes_for :user_groups, :allow_destroy => true

  attr_accessible :user_groups_attributes

  def available_parents

    scan_list = [self]
    recursive_children = []

    while current = scan_list.pop
      scan_list += current.children
      recursive_children += current.children
    end

    Group.where('not id in (?)', [self.id] + recursive_children.map(&:id))
  end


end
