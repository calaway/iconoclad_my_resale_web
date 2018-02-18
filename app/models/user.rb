class User < ApplicationRecord
  def self.find_or_create_from_oauth(oauth_info)
    current_user = find_or_create_by(uid: oauth_info[:uid]) do |user|
      user.provider = oauth_info[:provider]
      user.name = oauth_info[:info][:name]
      user.oauth_token = oauth_info[:credentials][:token]
      user.oauth_token_expires_at = Time.at(oauth_info[:credentials][:expires_at])
    end
    current_user.update(admin: admin?(oauth_info[:uid]))
    current_user
  end

  def self.admin?(uid)
    ENV.fetch('ADMINS').split(',').include?(uid)
  end
end
