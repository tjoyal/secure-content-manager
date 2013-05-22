class Server < ActiveRecord::Base
  attr_accessible :name, :group_id, :server_data_keys_attributes

  belongs_to :group

  has_many :server_data_keys, :dependent => :destroy
  accepts_nested_attributes_for :server_data_keys, :allow_destroy => true #:reject_if => lambda { |a| a[:content].blank? },

  def self.data_types
    [
        :server_data_keys
    ]
  end
end
