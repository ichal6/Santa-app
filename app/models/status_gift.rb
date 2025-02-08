class StatusGift < ApplicationRecord
  has_many :gifts, foreign_key: "status_gift_id"
end
