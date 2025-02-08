class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :wish_lists, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :gifts, foreign_key: "friend_user_id", dependent: :nullify
  has_many :owned_gifts, class_name: "Gift", foreign_key: "owner_id", dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
