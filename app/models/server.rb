class Server < ActiveRecord::Base
  attr_accessible :name, :group_id

  belongs_to :group

  def self.data_types
    [
        :keys,
        :notes,
        :passwords
    ]
  end

  self.data_types.each do |type|

    relation = "server_data_#{type}".to_sym

    has_many relation, :class_name => "ServerData::#{type.to_s.classify}", :dependent => :destroy
    accepts_nested_attributes_for relation, :allow_destroy => true

    attr_accessible "#{relation}_attributes".to_sym
  end

end
