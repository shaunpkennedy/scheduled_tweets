class TweetJob < ApplicationJob
  queue_as :default

  def perform(*args)
    return if tweet.published?

    # Rescheduled a tweet to the future
    return if tweet.publish_at > Time.Current

    tweet.publish_to_twitter!
  end
end
