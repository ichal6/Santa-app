class CreateStatusFriendships < ActiveRecord::Migration[8.0]
  def change
    create_table :status_friendships do |t|
      t.string :name

      t.timestamps
    end
  end
end
