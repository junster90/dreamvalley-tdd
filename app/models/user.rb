class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.authorised?(user)
    user.email.ends_with?("@mindvalley.com" || "@mindvalleysupport.com")
  end
end
