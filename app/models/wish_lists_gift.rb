class WishListsGift < ApplicationRecord
  # The foreign key is named "wl_id" rather than the conventional "wish_list_id,"
  belongs_to :wish_list, foreign_key: "wl_id"
  belongs_to :gift, foreign_key: "gift_id"
end
