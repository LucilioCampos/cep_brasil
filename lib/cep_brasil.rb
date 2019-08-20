require "cep_brasil/version"

module CepBrasil
  class RandomCep

    def initialize(cep=nil)
      @cep = cep
    end

    def parse_cep
      unless @cep.nil?
        cep = @cep.to_s
        valid =  @cep =~ /[^0-9]/
        if valid == 0
          return 'Caracteres inválido, favor utilizar so numeros'
        else
        valid_cep = @cep[0..4] + '-' + @cep[5..7]
        end
      end
    end

    def generate_cep
      @cep = rand(1111111..99999999) if @cep.nil
      valid_cep = @cep[0..4] + '-' + @cep[5..7]
    end

  end
end
