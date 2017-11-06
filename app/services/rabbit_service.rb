class RabbitService

  def self.retreive(mac, device_id)
    connection = Bunny.new(ENV['AMQP_URL'])
    connection.start
    channel = connection.create_channel
    queue = channel.queue("b8:27:eb:23:fd:12")
    queue.subscribe do |delivery_info, metadata, payload|
      response = (JSON.parse(payload))
      response["device_id"] = device_id
      MessageCreator.process_messages(response, device_id)
    end
    connection.close
  end

end
