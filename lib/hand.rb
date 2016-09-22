require 'byebug'
require_relative 'module_hand_rules'
require_relative 'deck'
# The logic of calculating pair, three-of-a-kind, two-pair, etc.
# goes here. Logic of which hand beats which would go here.

class Hand
  extend HandRules
  attr_accessor :hand
  attr_reader :suit_hash, :value_hash, :player

  def initialize(deck, player)
    @player = player
    @deck = deck
    @hand = []
    reset_hashes
  end

  def convert_to_hash
    hand.each do |card|
      @suit_hash[card.suit] += 1
      @value_hash[card.value] += 1
    end
  end

  def reset_hashes
    @suit_hash = Hash.new { |h, k| h[k] = 0 }
    @value_hash = Hash.new { |h, k| h[k] = 0 }
  end

  def draw_card
    reset_hashes
    @hand << @deck.draw_card
    convert_to_hash
  end
end

deck = Deck.new
a = Hand.new(deck, "Mike")
b = Hand.new(deck, "Jay")
c = Hand.new(deck, "Sabrina")
5.times do
  a.draw_card
  b.draw_card
  c.draw_card
end
p a.value_hash
p b.value_hash
p c.value_hash
p a.suit_hash
p b.suit_hash
p c.suit_hash
p Hand.winning_hand(a, b, c)
