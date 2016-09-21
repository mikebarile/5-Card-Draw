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

hands = Hash.new{|h,k| h[k] = 0}
1000000.times do
d = Deck.new
h = Hand.new(d)
5.times {h.draw_card}
hands[Hand.declare_hand_type(h)[0]] += 1
end
puts hands
