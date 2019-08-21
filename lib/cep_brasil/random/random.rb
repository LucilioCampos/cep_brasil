module CepBrasil::Random
  class << self

    def generate_formated
      @cep = rand(00000000..19999100).to_s
      valid_cep = @cep[0..4] + '-' + @cep[5..7]
    end

  end
end