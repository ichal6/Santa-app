class CreateWishListsGifts < ActiveRecord::Migration[8.0]
  def change
    create_table :wish_lists_gifts do |t|
      t.integer :wl_id, null: false # Wish List ID
      t.integer :gift_id, null: false # Gift ID

      t.timestamps
    end

    add_foreign_key :wish_lists_gifts, :wish_lists, column: :wl_id
    add_foreign_key :wish_lists_gifts, :gifts, column: :gift_id
  end
end
