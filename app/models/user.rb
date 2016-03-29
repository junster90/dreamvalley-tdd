class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.authorised?(user)
    user.email.ends_with?("@mindvalley.com" || "@mindvalleysupport.com")
  end

  def self.from_omniauth(auth)

  end

  def assign_from_omniauth(auth)
    self.provider = auth["provider"]
    self.uid = auth["uid"]
    self.first_name = auth["info"]["first_name"]
    self.last_name = auth['info']['last_name']
    self.email = auth["info"]["email"]
    self.token = auth["credentials"]["token"]
    self.id_token = auth["credentials"]["id_token"]
  end
end
