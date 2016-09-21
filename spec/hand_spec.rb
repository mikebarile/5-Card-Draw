require 'hand'
require 'rspec'

describe Hand do
  let(:deck) {double("deck", :draw_card => Card.new(:spades, :jack, 11))}
  subject(:hand) { Hand.new(deck) }

  describe '#initialize' do
    it 'sets @hand to an empty array' do
      expect(hand.hand).to eq([])
    end
  end

  describe '#convert_to_hash' do
    it 'converts deck to hash' do
      hand.convert_to_hash
      expect(hand.suit_hash).to be_an_instance_of(Hash)
      expect(hand.type_hash).to be_an_instance_of(Hash)
    end
  end

  describe '#draw_card' do
    it 'draws a card' do
      hand.draw_card
      expect(hand.hand[0]).to be_an_instance_of(Card)
    end
  end
end
