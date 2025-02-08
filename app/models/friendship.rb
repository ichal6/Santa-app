class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  belongs_to :status, class_name: "StatusFriendship"

  validates :user_id, :friend_id, :status_id, presence: true
end
