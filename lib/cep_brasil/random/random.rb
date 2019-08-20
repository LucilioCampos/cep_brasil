module CepBrasil::Random
  class << self

    def generate_formated
      @cep = rand(1111111..99999999).to_s
      valid_cep = @cep[0..4] + '-' + @cep[5..7]
    end

  end
end