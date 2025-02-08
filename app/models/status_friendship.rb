class StatusFriendship < ApplicationRecord
  has_many :friendships, foreign_key: "status_id"
end
