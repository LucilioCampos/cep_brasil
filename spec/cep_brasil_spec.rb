RSpec.describe CepBrasil do

  describe 'Validates a version' do
    it "has a version number" do
      expect(CepBrasil::VERSION).not_to be nil
    end

    it "does something useful" do
      expect
    end
  end

  describe 'returns a valid cep' do

    context "When I put chars into cep" do
      
      before :all do
        @random_cep = CepBrasil::RandomCep.new('not valid')
        end

        it 'returns a error message' do
          expect(@random_cep).to eq 'Caracteres inválido, favor utilizar so numeros'
        end
      end
    end
    
  end
end
