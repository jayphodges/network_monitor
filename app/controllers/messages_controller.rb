class MessagesController < ApplicationController

  def new
    binding.pry
    RabbitService.retreive()
    redirect_to devices_path
  end

end
