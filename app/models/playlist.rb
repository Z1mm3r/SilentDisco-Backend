class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs
  has_many :playlist_likes

  validates :title, presence: true

end
