class CreateGifts < ActiveRecord::Migration[8.0]
  def change
    create_table :gifts do |t|
      t.integer :friend_user_id # Nullable foreign key to users table (can be NULL)
      t.integer :status_gift_id, null: false # Foreign key to status_gift table (not NULL)
      t.string :name, null: false
      t.text :description

      t.timestamps
    end

    add_foreign_key :gifts, :users, column: :friend_user_id, on_delete: :nullify # Set NULL if user is deleted.
    add_foreign_key :gifts, :status_gifts, column: :status_gift_id
  end
end
