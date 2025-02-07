class UpdateGiftsFriendUserId < ActiveRecord::Migration[8.0]
  def change
    change_column_null :gifts, :friend_user_id, true

    add_foreign_key :gifts, :users, column: :friend_user_id, on_delete: :nullify
  end
end
