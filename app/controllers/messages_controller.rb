class MessagesController < ApplicationController

  def create

    RabbitService.retreive()
    redirect_to devices_path
  end

end
