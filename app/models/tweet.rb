class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 280 }
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end

  def published?
    tweet_id? #? returns true or false if value is retured
  end

  def publish_to_twitter!
    tweet = twitter_account.client.post("tweets", "{\"text\":\"#{body}\"}")
    update(tweet_id: tweet["data"]["id"])
  end

end
