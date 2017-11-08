class ApiService
  attr_reader :conn
  def initialize
    @conn = Faraday.new(:url => 'http://ip-api.com/json/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def reply(ip)
    JSON.parse(@conn.get(ip).body, symbolize_names: true)
  end

end
