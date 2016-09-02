class User < ActiveRecord::Base
  has_many :messages
  def self.from_omniauth(auth)
    # we try to find a user that matches the given provider and uid values from the hash and then we call first_or_initialize on the result of this
    # if the user changes their name or any other of their credentials these changes are picked up.
    # if user is new in our app we create new record i DB.
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.cover_image = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
