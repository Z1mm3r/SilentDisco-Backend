class Api::V1::SongsController < ApplicationController

  def index
    @playlists = Playlist.all
    render json: @playlists
  end

end
