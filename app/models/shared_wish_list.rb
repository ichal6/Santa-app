class SharedWishList < ApplicationRecord
  # Associate with the Friendship model using the custom foreign key "fr_id".
  belongs_to :friendship, foreign_key: "fr_id", optional: true

  # Associate with the WishList model using the custom foreign key "wl_id".
  belongs_to :wish_list, foreign_key: "wl_id"
end
