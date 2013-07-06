class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin
  # attr_accessible :title, :body

  has_many :user_groups, :dependent => :destroy

  def randomize_api_key!
    begin
      self.api_key = SecureRandom.hex
    end while self.class.exists?(:api_key => api_key)

    self.save!
  end
end
