require 'byebug'
require_relative 'module_hand_rules'
# The logic of calculating pair, three-of-a-kind, two-pair, etc.
# goes here. Logic of which hand beats which would go here.

class Hand
  extend HandRules
  attr_reader :hand

  def initialize
    @hand = []
  end

end
