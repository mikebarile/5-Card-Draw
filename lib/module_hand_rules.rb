module HandRules

  def winning_hand(*hands)

  end

  def declare_hand_type

  end

  private

    def royal_flush(hand)

      false
    end

    def straight_flush(hand)
      false
    end

    def four_kind(hand)
      false
    end

    def full_house(hand)
      false
    end

    def flush(hand)
      false
    end

    def straight(hand)
      false
    end

    def three_kind(hand)
      false
    end

    def pair(hand)
      if hand.type_hash.values.include?(2)
        
      end
      false
    end

    def high_card(hand)
      hand.sort[-1]
    end
end
