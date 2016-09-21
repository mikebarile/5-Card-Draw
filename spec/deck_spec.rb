require 'deck'
require 'rspec'

describe Deck do
  subject(:deck) { Deck.new }

  describe '#initialize' do
    it 'creates a deck of 52 cards' do
      expect(deck.length).to eq(52)
    end

    it 'cards are shuffled' do
      repeats = Hash.new { |h, k| h[k] = 0 }

      100.times do
        deck.shuffle
        repeats[deck[0]] += 1
      end

      expect(repeats[deck[0]]).to_not eq(100)
    end

    it 'discarded_cards pile is empty' do
      expect(deck.discarded_cards).to be_empty
    end
  end

  describe '#draw_card' do
    it "returns a card" do
      expect(deck.draw_card).to be_an_instance_of(Card)
    end

    it "removes a card from the deck" do
      deck.draw_card
      expect(deck.length).to eq(51)
    end
  end

  describe '#gather_discarded_cards' do
    it "adds received card to @discarded_cards" do
      deck.gather_discarded_cards(Card.new(:spades, :A),
          Card.new(:diamonds, :J))
      expect(deck.discarded_cards.length).to eq(2)
    end
  end
end
