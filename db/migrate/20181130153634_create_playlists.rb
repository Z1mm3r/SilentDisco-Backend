class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.integer :user_id
      t.string :title
      t.timestamps
    end
  end
end
