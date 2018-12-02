class CreatePlaylistLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :playlist_likes do |t|
      t.integer :user_id
      t.integer :playlist_id
      t.boolean :like

      t.timestamps
    end
  end
end
