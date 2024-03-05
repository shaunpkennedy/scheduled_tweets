class TweetJob < ApplicationJob
  queue_as :default

  def perform(*args)
    return if tweet.published?

    return if tweet.publish_at > Time.Current

    tweet.publish_to_twitter!
  end
end
