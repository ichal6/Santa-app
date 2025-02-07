class CreateSharedWishLists < ActiveRecord::Migration[8.0]
  def change
    create_table :shared_wish_lists do |t|
      t.integer :fr_id, null: false # Friendship ID (foreign key)
      t.integer :wl_id, null: false # Wish List ID (foreign key)

      t.timestamps
    end

    add_foreign_key :shared_wish_lists, :friendships, column: :fr_id, on_delete: :nullify
    add_foreign_key :shared_wish_lists, :wish_lists, column: :wl_id, on_delete: :cascade
  end
end
