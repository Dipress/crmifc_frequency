class BaseStationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @base_stations = BaseStation.all
  end

  def new
    @base_station = BaseStation.new
  end

  def create
    @base_station = BaseStation.new(create_params)
    if @base_station.save
      redirect_to @base_station
    else
      render :new
    end
  end

  def show
    @base_station = BaseStation.find(params[:id])
  end

  def edit
    @base_station = BaseStation.find(params[:id])
  end

  def update
    @base_station = BaseStation.find(params[:id])
    if @base_station.update(update_params)
      redirect_to @base_station
    else
      render :edit
    end
  end

  def delete
    @base_station = BaseStation.find(params[:id])
  end

  def destroy
    @base_station = BaseStation.find(params[:id])
    @base_station.destroy
    redirect_to @base_station
  end

  def create_params
    params.require(:base_station).permit(:billing_station_id, :name, :nagios, :ssid, :azimut, :correct, :mac, :note, 
      :hardware_id, :firmware_id, :registration_frequency_id, :actual_frequency_id, :bandwidth_id, :antenna_type_id)
  end

  alias update_params create_params
end
