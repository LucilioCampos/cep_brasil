require "cep_brasil/version"
require 'cep_brasil/random/random'
require 'cep_brasil/api/json'

module CepBrasil
  class RandomCep

    def initialize(cep=nil)
      @cep = cep
    end

    def parse_cep
      unless @cep.nil?
        if @cep.size == 8
          cep = @cep.to_s
          valid =  @cep =~ /[^0-9]/
          return valid_cep = @cep[0..4] + '-' + @cep[5..7] if valid.nil?
          return 'Caracteres inválido, favor utilizar so numeros'
        else
          return 'Necessário informar 8 numeros'
        end
      end
    end

  end
end
