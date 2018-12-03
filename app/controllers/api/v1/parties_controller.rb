class Api::V1::PartiesController < ApplicationController

  def create
    playlist = Playlist.find(params[:playlist_id])
    party = Party.new(party_params)
    if party.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
      PlaylistSerializer.new(playlist)
      ).serializable_hash
      ActionCable.server.broadcast `party_channel_#{party.id}`, serialized_data
      head :ok
    end
  end

  private

  def party_params
    params.permit(:playlist_id)
  end

end
