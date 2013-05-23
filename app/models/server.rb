class Server < ActiveRecord::Base
  attr_accessible :name, :group_id

  belongs_to :group

  def self.data_types
    [
        :server_data_keys,
        :server_data_notes
    ]
  end

  self.data_types.each do |type|
    has_many type, :dependent => :destroy
    accepts_nested_attributes_for type, :allow_destroy => true

    attr_accessible "#{type}_attributes".to_sym
  end

end
