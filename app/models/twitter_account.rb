class TwitterAccount < ApplicationRecord
  belongs_to :user

  validates :username, uniqueness: true #prevents from creating duplicate usernames
end
