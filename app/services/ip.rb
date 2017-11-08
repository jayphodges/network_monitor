class Ip
  attr_reader :city,
              :isp,
              :regionname

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
    @long = reponse[:long]
    @org = response[:org]
    @query = response[:query]
    @region = response[:region]
    @regionname = responsep[:regionName]
    @status = response[:status]
    @timezone = response[:timezone]
    @zip = response[:zip]
  end

  def self.return_city
    stores = ApiService.search_by_zip(zip)
    stores.map do |store|
      Store.new(store)
    end
  end
end
