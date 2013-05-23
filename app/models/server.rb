class Server < ActiveRecord::Base
  attr_accessible :name, :group_id, :server_data_keys_attributes, :server_data_notes_attributes

  belongs_to :group

  has_many :server_data_keys, :dependent => :destroy
  accepts_nested_attributes_for :server_data_keys, :allow_destroy => true

  has_many :server_data_notes, :dependent => :destroy
  accepts_nested_attributes_for :server_data_notes, :allow_destroy => true

  def self.data_types
    [
        :server_data_keys,
        :server_data_notes
    ]
  end

end
