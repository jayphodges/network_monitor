class Location
  attr_reader :city,
              :isp,
              :regionname,
              :region

  def initialize(response = {})
    @longname = response[:longName]
    @distance = response[:distance]
    @phone_number = response[:phone]
    @store_type = response[:storeType]
    @as = response[:as]
    @city = response[:city]
    @country = response[:country]
    @countrycode = response[:countrycode]
    @isp = response[:isp]
    @lat = response[:lat]
    @long = response[:long]
    @org = response[:org]
    @query = response[:query]
    @region = response[:region]
    @regionname = response[:regionName]
    @status = response[:status]
    @timezone = response[:timezone]
    @zip = response[:zip]
    @con = ApiService.new
  end

  def self.return_city(ip_address)
    response = ApiService.new.reply(ip_address)
    Location.new(response)
  end

end
