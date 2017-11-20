class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to vehicles_path, notice: "The vehicle has been created!" and return
    end
    render 'new'
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])

    if @vehicle.update_attributes(vehicle_params)
      redirect_to vehicles_path, notice: "#{first_name} #{last_name} has been updated!" and return
    end

    render 'edit'
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    redirect_to vehicles_path, notice: "#{first_name} #{last_name} has been deleted!" and return
  end
private
  def vehicle_params
    params.require(:vehicle).permit(:uuid)
  end
end
