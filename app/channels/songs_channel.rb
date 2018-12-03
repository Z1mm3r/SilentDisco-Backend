class SongsChannel < ApplicationCable::Channel
  def subscribed
    party = Party.find(params[:party])
    stream_for party
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
