class PlaylistSong < ApplicationRecord
  belongs_to :playlist
  belongs_to :song
  validates :url, presence: true
end
