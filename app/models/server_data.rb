module ServerData

  def self.included(base)
    base.belongs_to :server
  end

end