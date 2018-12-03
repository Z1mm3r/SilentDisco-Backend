class Api::V1::SongsController < ApplicationController

  def index
    @songs = Song.all
    render json: @songs.as_json(:only => [:url,:id,:name,:artist] )
  end

end
