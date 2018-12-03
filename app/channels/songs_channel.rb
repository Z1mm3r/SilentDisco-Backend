class SongsChannel < ApplicationCable::Channel
  def subscribed
    party = Playlist.find(params[:playlist])
    stream_for party
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
