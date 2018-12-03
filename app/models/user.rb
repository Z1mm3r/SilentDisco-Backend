class User < ApplicationRecord
  has_many :playlists
  has_many :playlist_likes
  has_secure_password validation: false
  validates :name, uniqueness: true
  validates :name, presence: true

  def toJson
    self.as_json( :methods => [:user_playlists,:total_likes], :only => [:name,:id] )
  end

  def user_playlists
    self.playlists.as_json(:methods => [:songsInPlaylist,:likes], :only => [:user_id,:id,:title] )
  end

  def total_likes
    self.playlists.reduce(0){|acc,element| element.likes + acc }
  end

end
