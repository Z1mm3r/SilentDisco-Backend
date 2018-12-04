class AddImgUrlToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :imgUrl, :string
    remove_column :songs, :artist
  end
end
