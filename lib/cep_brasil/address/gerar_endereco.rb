require 'json'

module CepBrasil
  module Address

    BASE_URL = "https://viacep.com.br/ws"
  

    class Generate
      include Request
      attr_reader :cep, :logradouro, :complemento, :bairro
      attr_reader :localidade, :uf, :unidade, :ibge, :gia, :endereco

      def initialize(cep_entry, response_type)
        cep_entry = normalize cep_entry
        params = connect cep_entry, response_type
        @cep = params['cep']
        @logradouro ||= params['logradouro']
        @complemento ||= params['complemento']
        @bairro ||= params['bairro']
        @localidade ||= params['localidade']
        @uf ||= params['uf']
        @unidade ||= params['unidade']
        @ibge ||= params['ibge']
        @gia ||= params['gia']
        params
      end

      def full_address
        endereco = {
          cep: @cep,
          logradouro: @logradouro,
          complemento: @complemento,
          bairro: @bairro,
          localidade: @localidade,
          uf: @uf,
          unidade: @unidade,
          ibge: @ibge,
          gia: @gia
        }
      end


      private
      
      def connect(cep_entry, response_type)
        request = "#{BASE_URL}/#{cep_entry}/#{response_type}"
        params = get(request)
      end

      def normalize(cep)
        normalcep = cep.gsub('-', '')
      end

    end
  end
end