require 'byebug'
require_relative 'module_hand_rules'
require_relative 'deck'
# The logic of calculating pair, three-of-a-kind, two-pair, etc.
# goes here. Logic of which hand beats which would go here.

class Hand
  extend HandRules
  attr_accessor :hand
  attr_reader :suit_hash, :value_hash

  def initialize(deck)
    @deck = deck
    @hand = []
    @suit_hash = Hash.new { |h, k| h[k] = 0 }
    @type_hash = Hash.new { |h, k| h[k] = 0 }
  end

  def convert_to_hash
    hand.each do |card|
      @suit_hash[card.suit] += 1
      @value_hash[card.value] += 1
    end
  end

  def draw_card
    @hand << @deck.draw_card
  end
end
d = Deck.new
h = Hand.new
5.times {h.draw_card}
p Hand.declare_hand_type(h)
p h
