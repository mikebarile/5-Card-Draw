require 'byebug'
require_relative 'module_hand_rules'
# The logic of calculating pair, three-of-a-kind, two-pair, etc.
# goes here. Logic of which hand beats which would go here.

class Hand
  extend HandRules

  attr_accessor :hand
  attr_reader :suit_hash, :type_hash

  def initialize(deck)
    @deck = deck
    @hand = []
    @suit_hash = Hash.new { |h, k| h[k] = 0 }
    @type_hash = Hash.new { |h, k| h[k] = 0 }
  end

  def convert_to_hash
    hand.each do |card|
      @suit_hash[card.suit] += 1
      @type_hash[card.type] += 1
    end
  end

  def draw_card
    @hand << @deck.draw_card
  end

end
