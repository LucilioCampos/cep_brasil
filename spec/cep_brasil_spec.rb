RSpec.describe CepBrasil do

  describe 'Validates a version' do

    it "has a version number" do
      expect(CepBrasil::VERSION).not_to be nil
    end

  end
  
  describe 'When build a cep' do
    

    it 'when try less than 8 digits' do
      cep = CepBrasil::RandomCep.new('123456')
      expect(cep.parse_cep).to eq 'Necessário informar 8 numeros'
    end

    it 'when try more than 8 digits' do
      cep = CepBrasil::RandomCep.new('Iam not valid')
      expect(cep.parse_cep).to eq 'Necessário informar 8 numeros'
    end

    it 'when try with 8 alphanumeric' do
      cep = CepBrasil::RandomCep.new('1nv4l1d$')
      expect(cep.parse_cep).to eq 'Caracteres inválido, favor utilizar so numeros'
    end

    it 'when try with 8 valid digits' do
      cep = CepBrasil::RandomCep.new('01234578')
      expect(cep.parse_cep).to eq '01234-578'
    end

    it 'generates random' do
      cep = CepBrasil::Random.generate_formated
      expect(cep.size).to eq 9
    end

    it 'returns a response status 200' do
      response = CepBrasil::Api::Json.new('json', '01001001')
      expect(response.get_cep.code).to eq 200
    end

    it 'returns a resource bairro' do
      new_cep = CepBrasil::Api::Json.new('json', '01001001')
      expect(JSON.parse(new_cep.get_cep)['cep']).to eq '01001-001'
    end

    it 'returns a response a resource bairro' do
      new_cep = CepBrasil::Api::Json.new('json', '01001001')
      expect(JSON.parse(new_cep.get_cep)['bairro']).to eq 'Sé'
    end

    it 'returns a response a resource complemento' do
      new_cep = CepBrasil::Api::Json.new('json', '01001001')
      expect(JSON.parse(new_cep.get_cep)['complemento']).to eq 'lado par'
    end

    it 'returns a response a resource localidade' do
      new_cep = CepBrasil::Api::Json.new('json', '01001001')
      expect(JSON.parse(new_cep.get_cep)['localidade']).to eq 'São Paulo'
    end

    it 'returns a response a resource uf' do
      new_cep = CepBrasil::Api::Json.new('json', '01001001')
      expect(JSON.parse(new_cep.get_cep)['uf']).to eq 'SP'
    end

  end

end
