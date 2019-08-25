module CepBrasil::Random
  class << self
    attr_reader :cep

    def generate_formatted(cep=nil)
      @cep = cep
      parse_cep(@cep)
    end

    private

    def parse_cep(cep=nil)
      @cep ||= cep
      return generate if @cep.nil?
      @cep = @cep.to_s
      raise 'Necessário informar 8 números!' if @cep.size != 8
      valid =  @cep =~ /[^0-9]/
      raise 'Necessário informar sómente números' unless valid.nil?
      @cep = "#{@cep[0..4]}-#{@cep[5..7]}" if valid.nil?
      return @cep
    end

    def generate
      @cep = "#{rand(10000000..19999100)}"
      @cep = "#{@cep[0..4]}-#{@cep[5..7]}"
    end

  end
end