require "faraday"
require "multi_json"

module FreeGeoIP  
  @@freegeoip_url = 'http://freegeoip.net/json'

  def self.url
    @@freegeoip_url
  end

  def self.url=(url)
    @@freegeoip_url = url
  end 

  def self.connection
    Faraday.new(:url => url) do |builder|
      builder.adapter Faraday.default_adapter
    end
  end

  def self.locate(address)
    if (response = connection.get(address)).success?
      MultiJson.decode(response.body)
    else
      false
    end
  end
end

require "freegeoip/version"
require "freegeoip/response"
