class Card
  VALUES = [:two, :three, :four, :five, :six, :seven, :eight , :nine,
     :ten, :J, :Q, :K, :A]
  SUITS = [:spades, :hearts, :diamonds, :clubs]

  def self.generate_cards
    @@deck = []
    VALUES.each do |value|
      SUITS.each do |suit|
        @@deck << Card.new(suit, value)
      end
    end
    @@deck
  end

  attr_reader :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

end
