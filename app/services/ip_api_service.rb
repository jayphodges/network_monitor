class IpApiService

  def initialize
    @conn = Faraday.new(:url => 'http://ip-api.com/json/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def return_location(ip)
    reply = @conn.get(ip)
    JSON.parse(reply.body)["city"]
  end

end
