require 'rest-client'
require 'json'

module CepBrasil::Api
  BASE_URL = "viacep.com.br/ws"
  class Json
    attr_reader :request, :response

    def initialize(response_type, cep)
      @response_type = response_type
      @cep = cep
      @request = "#{BASE_URL}/#{cep}/#{response_type}"
    end

    def get_cep
      @response = RestClient.get(@request)
    end
  
  end
end