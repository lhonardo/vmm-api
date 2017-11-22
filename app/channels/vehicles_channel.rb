class VehiclesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'vehicles'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
