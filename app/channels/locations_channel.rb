class LocationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'locations'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
