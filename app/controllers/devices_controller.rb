class DevicesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :inet_not_found

  def index
    @devices = Device.page(params[:page]).per(50)
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(create_params)
    if @device.save
      @contract = Device::Services::Create.new(@device).contract
      redirect_to @device
    else
      render :new
    end
  end

  def show
    @device = Device.find(params[:id])
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update(update_params)
      @contract = Device::Services::Create.new(@device).contract
      @contract.contract_parameter_type1.where(pid: 75).update(val: @device.frequency)
      redirect_to @device
    else
      render :edit
    end
  end

  def delete
    @device = Device.find(params[:id])
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to @device
  end

  def create_params
    params.require(:device).permit(:login, :frequency)
  end

  def update_params; create_params end

  def inet_not_found
    render :failing
  end
end
