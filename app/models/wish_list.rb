class WishList < ApplicationRecord
  belongs_to :user
  has_many :wish_lists_gifts, dependent: :destroy, foreign_key: :wl_id
  has_many :gifts, through: :wish_lists_gifts, dependent: :destroy

  validates :name, presence: true
end
