require "faraday"
require "multi_json"

module FreeGeoIP 
  @url = 'http://freegeoip.net/json'
  @timeout = 5
  @open_timeout = 2

  class << self
    attr_accessor :url, :timeout, :open_timeout

    def connection
      Faraday.new(:url => url) do |builder|
        builder.adapter Faraday.default_adapter
      end
    end

    def locate(address)
      if (response = connection.get(address, options: {timeout: self.timeout, open_timeout: self.open_timeout})).success?
        MultiJson.decode(response.body)
      else
        false
      end
    end
  end

end

require "freegeoip/version"
require "freegeoip/response"
