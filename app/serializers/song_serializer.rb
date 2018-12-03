class SongSerializer < ActiveModel::Serializer
  attributes :id, :url, :name, :playlist_id
end
