class Song < ApplicationRecord
  validates :url, presence: true

  def toJson
    # {id: self.id, video: {id: {videoId: self.url}}, snippet: {title: self.name}}.as_json
    {video: {id: {videoId: self.url}, snippet: {title: self.name, thumbnails: {default: {url: self.imgUrl}}}}}.as_json
  end

  def self.convertJsonToSong(songs)
    songs.map do |song|
      url = song["id"]["videoId"]
      name = song["snippet"]["title"]
      imgUrl = song["snippet"]["thumbnails"]["default"]["url"]
      {url: url, name: name, imgUrl: imgUrl}
      # {video: {id: {videoId: url}, snippet: {title: name, thumbnails: {default: {url: imgUrl}}}}}
    end
  end

  # def self.songToJson(songs)
  #   songs.map do |song|
  #     url = song["id"]["videoId"]
  #     name = song["snippet"]["title"]
  #     imgUrl = song["snippet"]["thumbnails"]["default"]["url"]
  #     {video: {id: {videoId: url}, snippet: {title: name}}}
  #   end
  # end

end



# // {video: {id: {videoId: "CIWUEHCWEUFH(FH@#RY@(C*F))"},
# //         snippet: {title: "Cool Song"}
# //         }
# // }
