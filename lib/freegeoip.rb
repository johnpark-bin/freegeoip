require "faraday"
require "multi_json"

module FreeGeoIP 
  attr_accessor :timeout, :open_timeout

  @@freegeoip_url = 'http://freegeoip.net/json'
  @@timeout = 5
  @@open_timeout = 2

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
    if (response = connection.get(address, timeout: @@timeout, open_timeout: @@open_timeout)).success?
      MultiJson.decode(response.body)
    else
      false
    end
  end
end

require "freegeoip/version"
require "freegeoip/response"
