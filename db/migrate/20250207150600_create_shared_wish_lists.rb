class CreateSharedWishLists < ActiveRecord::Migration[8.0]
  def change
    create_table :shared_wish_lists do |t|
      t.integer :fr_id, null: false # Friendship ID
      t.integer :wl_id, null: false # Wish List ID

      t.timestamps
    end

    add_foreign_key :shared_wish_lists, :friendships, column: :fr_id
    add_foreign_key :shared_wish_lists, :wish_lists, column: :wl_id
  end
end
