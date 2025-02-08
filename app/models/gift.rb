class Gift < ApplicationRecord
  # It's a friend id that assign to present.
  belongs_to :friend_user, class_name: "User", optional: true

  belongs_to :status_gift

  validates :name, presence: true
end
