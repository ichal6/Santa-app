class CreateStatusGifts < ActiveRecord::Migration[8.0]
  def change
    create_table :status_gifts do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
