require_relative "../lib/pizzabot/delievery"

RSpec.describe Pizzabot do

  describe '#process' do
    let(:delievery) { Pizzabot.pizzabot("5x5 (1, 3) (4, 4)") }

    it 'returns the correct directions' do
      expect(delievery).to eq "ENNNDEEEND"
    end

  end
end
