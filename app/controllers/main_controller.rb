class MainController < ApplicationController
  def start_data
    ActionCable.server.broadcast('vehicles', Vehicle.all)
    ActionCable.server.broadcast('locations', Location.all)

    render json: {}
  end

  def clear_data
    Location.destroy_all
    Vehicle.destroy_all

    ActionCable.server.broadcast('vehicles', Vehicle.all)
    ActionCable.server.broadcast('locations', Location.all)

    render json: {}
  end

  def vehicle_registration
    Vehicle.create(id: params['id'])

    ActionCable.server.broadcast('vehicles', Vehicle.all)

    render json: {}
  end

  def vehicle_location_update
    Location.create(vehicle: params['id'], lat: params['lat'], lng: params['lng'], at: params['at'])

    ActionCable.server.broadcast('locations', Location.all)

    render json: {}
  end

  def vehicle_deregistration
    Vehicle.any_in(:_id => [params['id']]).destroy_all

    ActionCable.server.broadcast('vehicles', Vehicle.all)

    render json: {}
  end
end
