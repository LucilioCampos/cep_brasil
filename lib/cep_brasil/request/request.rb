
module CepBrasil
  module Request

    require 'json'
    require 'net/http'
    require 'uri'

    def get(route)
        request(route)
    end

    def request(url)
        result = Net::HTTP.get(URI.parse(url))
        JSON.parse(result)
    end

  end
end