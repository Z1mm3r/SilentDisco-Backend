class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :songs
  belongs_to :user
end
