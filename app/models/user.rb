class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:mindvalley]

  def self.authorised?(user)
    user.email.ends_with?("@mindvalley.com" || "@mindvalleysupport.com")
  end

  def self.from_omniauth(auth)
    user = where(provider: auth["provider"], uid: auth["uid"].to_s).first || where(email: auth["info"]["email"]).first || self.new()
    user.assign_from_omniauth(auth)
    if User.authorised?(user)
      return user
    else
      return nil
    end
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
