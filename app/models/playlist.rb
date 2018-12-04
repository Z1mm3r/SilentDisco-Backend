class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs
  has_many :playlist_likes
  has_many :songs, through: :playlist_songs

  validates :title, presence: true

  def songsInPlaylist
    self.songs.map{|song| song.toJson}
  end

  def likes
    self.playlist_likes.select do |element|
      element.like
    end.length
  end

  def dislikes
    self.playlist_likes.select do |element|
      !element.like
    end.length
  end

end
