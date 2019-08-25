RSpec.describe CepBrasil do

  describe 'Validates a version' do

    it "has a version number" do
      expect(CepBrasil::VERSION).not_to be nil
    end

  end
  
  describe 'When build a random cep' do

    it 'raise error less than 8 digits' do
      expect {
        CepBrasil::Random.generate_formatted('123456')
      }.to raise_error(RuntimeError)
    end

    it 'raise error try more than 8 digits' do
      expect {
        CepBrasil::Random.generate_formatted('123456789')
      }.to raise_error(RuntimeError)
    end

    it 'raise error try with 8 alphanumeric' do
      expect {
        CepBrasil::Random.generate_formatted('1nv4l1d$')
      }.to raise_error(RuntimeError)
    end

    it 'valid try with 8 valid digits' do
      cep = CepBrasil::Random.generate_formatted('12345678')
      expect(cep).to eq '12345-678'
    end

    it 'valid with no arguments' do
      cep = CepBrasil::Random.generate_formatted
      expect(cep.size).to eq 9
    end

  end

  context 'When generate an Address' do
    
    before :all do
      @endereco = CepBrasil::Address::Generate.new('01001001', 'json')
    end

    it 'returns a full address' do
      expect(@endereco.full_address.size).to eq 9
    end

    it 'returns a resource cep' do
      expect(@endereco.cep).to eq '01001-001'
    end

    it 'returns a response a resource bairro' do
      expect(@endereco.bairro).to eq 'Sé'
    end

    it 'returns a response a resource complemento' do
      expect(@endereco.complemento).to eq 'lado par'
    end

    it 'returns a response a resource localidade' do
      expect(@endereco.localidade).to eq 'São Paulo'
    end

    it 'returns a response a resource uf' do
      expect(@endereco.uf).to eq 'SP'
    end

    it 'returns a exception without arguments' do
      expect { 
        CepBrasil::Address::Generate.new 
      }.to raise_error(ArgumentError)
    end
    
  end

end
