class AddOwnerIdToGifts < ActiveRecord::Migration[8.0]
  def change
    add_column :gifts, :owner_id, :integer, null: false

    add_foreign_key :gifts, :users, column: :owner_id, on_delete: :cascade

    # Ensure owner_id is indexed for performance
    add_index :gifts, :owner_id
  end
end
