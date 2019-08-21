module CepBrasil
  module Endereco
    class << self
      attr_reader :cep, :logradouro, :complemento, :bairro
      attr_reader :localidade, :uf, :unidade, :ibge, :gia, :endereco

      def initialize(params)
        @cep = params['cep']
        @logradouro ||= params['logradouro']
        @complemento ||= params['complemento']
        @bairro ||= params['bairro']
        @localidade ||= params['localidade']
        @uf ||= params['uf']
        @unidade ||= params['unidade']
        @ibge ||= params['ibge']
        @gia ||= params['gia']
        endereco
      end

      def endereco
        @endereco = {
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

    end
  end
end