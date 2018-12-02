class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :url
      t.string :name
      t.string :artist
      t.timestamps
    end
  end
end
