class User < ActiveRecord::Base
  # uses omniauth to check Twitter and log in to app
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid).permit!).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_secret = auth.credentials.secret
      user.save!
    end
  end

  # uses omniauth to create tweets and send them to Twitter
  def tweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.config.twitter_key
      config.consumer_secret     = Rails.application.config.twitter_secret
      config.access_token        = oauth_token
      config.access_token_secret = oauth_secret
    end
    client.update(tweet)
  end

  # grabs Twitter user's home_timeline
  def home_timeline
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.config.twitter_key
      config.consumer_secret     = Rails.application.config.twitter_secret
      config.access_token        = oauth_token
      config.access_token_secret = oauth_secret
    end
    return client.home_timeline
  end
end