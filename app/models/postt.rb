class Postt < ActiveRecord::Base
	def self.from_omniauth(auth)
		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |post|
			post.provider = auth.provider
			post.uid = auth.uid
			post.uid = auth.info.name
			post.oauth_token = auth.credentials.oauth_token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.save!
		end
	end
end
