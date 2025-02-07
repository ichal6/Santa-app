class CreateWishLists < ActiveRecord::Migration[8.0]
  def change
    create_table :wish_lists do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.boolean :is_public, default: true

      t.timestamps
    end

    add_foreign_key :wish_lists, :users, column: :user_id, on_delete: :nullify
  end
end
