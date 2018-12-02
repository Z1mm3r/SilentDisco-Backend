class User < ApplicationRecord
  has_many :playlists
  has_many :playlist_likes
  has_secure_password validation: false
  validates :name, uniqueness: true
  validates :name, presence: true
  
end
