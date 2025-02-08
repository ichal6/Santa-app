class Gift < ApplicationRecord
  has_many :wish_lists_gifts, foreign_key: "gift_id", dependent: :destroy
  has_many :wish_lists, through: :wish_lists_gifts

  belongs_to :user, foreign_key: "friend_user_id", optional: true
  belongs_to :owner, class_name: "User", foreign_key: "owner_id", optional: false

  validates :name, presence: true
  validates :owner_id, presence: true
end
