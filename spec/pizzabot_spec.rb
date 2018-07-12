require_relative "../lib/pizzabot/delivery"

RSpec.describe Pizzabot do

  describe '#process' do
    let(:delivery) { Pizzabot.go("5x5 (1, 3) (4, 4)") }

    it 'returns the correct directions' do
      expect(delivery).to eq "ENNNDEEEND"
    end

  end
end
