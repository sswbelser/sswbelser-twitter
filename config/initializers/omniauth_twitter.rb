Rails.application.config.middleware.use OmniAuth::Builder do
	# sets up omniath with the twitter key and secret that was provided
	provider :twitter, Rails.application.config.twitter_key, Rails.application.config.twitter_secret
end