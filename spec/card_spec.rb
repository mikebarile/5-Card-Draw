require 'card'
require 'rspec'

describe Card do

  describe 'Card::generate_cards' do
    it "has the corect number of cards" do
      expect(Card.generate_cards.length).to eq(52)
    end
  end

  describe '#initialize' do
    let(:card) { Card.new(:spades, :A) }

    it 'sets suit' do
      expect(card.suit).to eq(:spades)
    end

    it 'sets value' do
      expect(card.value).to eq(:A)
    end
  end

  

end
