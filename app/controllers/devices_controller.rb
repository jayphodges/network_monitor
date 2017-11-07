class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]
  before_action :authorize!

  def index
    @devices = @current_user.devices
  end

  def show
    @messages = @device.messages
  end

  def new
    @device = Device.new
  end

  def edit
  end

  def create
    @device = Device.new(device_params.merge(user_id: current_user.id))
    if @device.save
      redirect_to @device, notice: 'Device was successfully created.'
    else
      render :new
    end
  end

  def update
    if @device.update(device_params)
      redirect_to @device, notice: 'Device was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @device.destroy
    redirect_to devices_url, notice: 'Device was successfully destroyed.'
  end

  def download
    device = Device.find(params["format"])
    RabbitService.retreive(device.mac, device.id)
    redirect_to devices_path
  end

  private
    def set_device
      @device = Device.find(params[:id])
    end

    def device_params
      params.require(:device).permit(:name, :mac, :user_id)
    end
end
