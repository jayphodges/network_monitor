class MessageCreator
  def self.process_messages(response, device_id)
      mac = response["mac"]
      host = response["host"]
      tx = response["tx"].to_i
      rx = response["rx"].to_i
      pl = response["pl"].to_f
      min = response["min"].to_f
      max = response["max"].to_f
      ave = response["ave"].to_f
      stddev = response["stddev"].to_f
      device_id = response["device_id"].to_i
      created_at = Time.parse(response["date"])
      source = response["source"]
      Message.create(mac: mac, tx: tx, rx: rx, pl: pl, min: min, max: max,
                     stddev: stddev, device_id: device_id, ave: ave,
                     host: host, created_at: created_at, source: source
                     )
  end
end
