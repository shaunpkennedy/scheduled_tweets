class TwitterAccount < ApplicationRecord
  has_many :tweets, dependent: :destroy
  belongs_to :user

  validates :username, uniqueness: true #prevents from creating duplicate usernames

  ### https://sferik.github.io/x-ruby/
  def client
    x_credentials = {
      api_key: Rails.application.credentials.dig(:twitter, :api_key),
      api_key_secret: Rails.application.credentials.dig(:twitter, :api_secret),
      access_token: token,
      access_token_secret: secret,
    }

    X::Client.new(**x_credentials)
  end

end
