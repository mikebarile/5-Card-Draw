module HandRules
  CARD_VALUE_TYPE_PAIRS = {two: 2, three: 3, four: 4, five: 5, six: 6,
    seven: 7, eight: 8, nine: 9, ten: 10, jack: 11, queen: 12, king: 13,
    ace: 14}
  HAND_HIERARCHY =

  def winning_hand(*hands)
    hands.map!{|hand| declare_hand_type(hand)}

  end

  def declare_hand_type(hand)
    # return royal_flush(hand) if royal_flush(hand)
    # return straight_flush(hand) if straight_flush(hand)
    # return four_kind(hand) if four_kind(hand)
    # return flush(hand) if flush(hand)
    # return straight(hand) if straight(hand)
    # return three_kind(hand) if three_kind(hand)
    # return two_pair(hand) if two_pair(hand)
    # return pair(hand) if pair(hand)

    royal_flush(hand) ||
    straight_flush(hand) ||
    four_kind(hand) ||
    flush(hand) ||
    straight(hand) ||
    three_kind(hand) ||
    two_pair(hand) ||
    pair(hand) ||
    high_card(hand)
  end

  private

    def royal_flush(hand)
      has_straight_flush = straight_flush(hand)
      if has_straight_flush && has_straight_flush[1] == 14
        [:royal_flush, 14]
      else
        false
      end
    end

    def straight_flush(hand)
      has_flush = flush(hand)
      has_straight = straight(hand)
      if has_trip && has_pair
        [:straight_flush, hand.value_hash.keys.max]
      else
        false
      end
    end

    def four_kind(hand)
      fours = hand.value_hash.select{ |_, occurances| occurances == 4 }
      fours.length == 1 ? [:four_kind, fours.keys[0]] : false
    end

    def full_house(hand)
      has_trip = three_kind(hand)
      has_pair = pair(hand)
      if has_trip && has_pair
        [:full_house, { trip: has_trip[1], pair: has_pair[1] } ]
      else
        false
      end
    end

    def flush(hand)
      p_flush = hand.suit_hash.select { |_, freq| freq == 5 }
      p_flush.count == 1 ? [:flush, hand.value_hash.keys.max] : false
    end

    def straight(hand)
      p_straight = hand.value_hash.keys.sort
      diff = p_straight[-1] - p_straight[0]
      diff == 4 ? [:straight, p_straight[-1]] : false
    end

    def three_kind(hand)
      trips = hand.value_hash.select{|_, occurances| occurances == 3}
      trips.length == 1 ? [:three_kind, pairs.keys[0]] : false
    end

    def two_pair(hand)
      pairs = hand.value_hash.select{|_, occurances| occurances == 2}
      pairs.length == 2 ? [:two_pair, pairs.keys.max] : false
    end

    def pair(hand)
      hand_type = [:pair, @value_hash.key(2)]
      hand_type[1] ? hand_type : false
    end

    def high_card(hand)
      [:high_card, hand.sort[-1].value]
    end
end
