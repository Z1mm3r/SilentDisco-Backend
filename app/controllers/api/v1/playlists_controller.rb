class Api::V1::PlaylistsController < ApplicationController

  before_action :find_playlist, only: [:show, :edit, :update, :destroy]

  def index
    @playlists = Playlist.all
    output = []
    @playlists.each do |playlist|
      outputElement = playlist.as_json(:methods => [:songsInPlaylist,:likes], :only => [:user_id,:id,:title])
      output.push(outputElement)
    end
    render :json => output.as_json
  end

  def show
    render :json => @playlist.as_json(:methods => [:songsInPlaylist,:likes], :only => [:user_id,:id,:title])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    byebug
    @playlist = Playlist.create(new_playlist_params)
    render :json => @playlist
    #@playlist.name = params['playlist']['name']
    #@playlist.password = params['playlist']['password']
    #check that playlist is valid... if not return an error
  end

  def edit

  end

  def updated
    @playlist.update(new_playlist_params)
    #check that is valid
  end

  def destroy
    @playlist.destroy
  end

  private

  def new_playlist_params
    params.require(:playlist).permit(:title,:user_id, :playlist => [])
  end

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end

end
