class Api::V1::SongsController < ApplicationController

  def index
    @songs = Song.all
    render json: @songs.as_json(:only => [:url,:id,:name,:artist] )
  end

  def create
    @song = Song.create(song_params)
  end

  private

  def song_params
    params.require(:video).permit(:url, :name)
  end

end

# // {video: {id: {videoId: "CIWUEHCWEUFH(FH@#RY@(C*F))"},
# //         snippet: {title: "Cool Song"}
# //         }
# // }
