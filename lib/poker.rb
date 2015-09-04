class Poker
  attr_reader :cards

  def initialize(cards)
    if cards.length > 5
      raise ArgumentError, "You have too many cards in your hand, try again."
    elsif cards.length < 5
      raise ArgumentError "You need more cards to play, try again."
    else
      @cards = cards
    end
  end

  def cards_reminder
    cards = @cards
    result = ''
    comma = ", "
    for card in cards do
      if cards[-1] != card
        card = card + comma
      end
        result = result + card.to_s
    end
    return "Your hand: " + result
  end

  def change_cards
    cards = @cards
    newCards = []
    numbers = [2, 3, 4, 5, 6, 7, 8, 9]
    for card in cards do
      cardObj = {number: 0, suit:0}
      for number in numbers
        if card.include? number.to_s
          cardObj[:number] = number
        end
      end
      if card.include? "Jack"
        cardObj[:number] = 11
      elsif card.include? "Queen"
        cardObj[:number] = 12
      elsif card.include? "King"
        cardObj[:number] = 13
      elsif card.include? "Ace"
        cardObj[:number] = 1
      end
      if card.include? "Hearts"
        cardObj[:suit] = 1
      elsif card.include? "Diamonds"
        cardObj[:suit] = 2
      elsif card.include? "Clubs"
        cardObj[:suit] = 3
      elsif card.include? "Spades"
        cardObj[:suit] = 4
      end
      newCards.push(cardObj)
    end
    return newCards
  end

  def royal_flush?
    cards = self.change_cards
    suitCount = 0
    numberCount = 0
    sorted = []

    for card in cards do
      if cards[-1] != card
        nextCard = cards[cards.index(card) + 1]
        if card[:suit] == nextCard[:suit]
          suitCount += 1
        end
      end
    end
    if suitCount == 4
      for card in cards do
        sorted.push(card[:number])
      end
      sorted = sorted.sort
      if sorted[0] == 1
        numberCount += 1
      end
      sorted.
    end
  end

  def straight_flush?(cards)
    # flushCount = 0
    # for card in cards do
    #   if cards[-1] != card
    #     nextCard = cards[cards.index(card) + 1]
    #     if card[:suit] == nextCard[:suit]
    #       flushCount += 1
    #     end
    #   end
    # end
    # return flushCount == 4
    # sorted = []
    # count = 0
    # for card in cards do
    #   sorted.push(card[:number])
    # end
    # sorted = sorted.sort
    # for num in sorted do
    #   if num + 1 == sorted[sorted.index(num)+1]
    #     count += 1
    #   end
    # end
    # return count == 4
  end

  def four_of_a_kind?(cards)
    # count = 0
    # for card in cards do
    #   if cards[-1] != card
    #     nextCard = cards[cards.index(card) + 1]
    #     if card[:number] == nextCard[:number]
    #       count += 1
    #     end
    #   end
    # end
    # return count == 4
  end

  def full_house(cards)
    # three_of_kind = false
    # pair = false
    #
    #
    # return three_of_a_kind && pair
  end

  def flush(cards)
  end

  def straight(cards)
  end

  def three_of_a_kind(cards)
  end

  def two_pair(cards)
  end

  def pair(cards)
  end

  def high_card(cards)
    highCard = 0
    for card in cards do
      if card[:number].to_i >= highCard.to_i
        highCard = card[:number].to_i
      end
    end
    return highCard
  end

  def get_best_hand
    cards = @cards.change_cards
    if cards.royal_flush?
      return "Royal Flush!"
    elsif cards.straight_flush?
      return "Straight Flush!"
    elsif cards.four_of_a_kind?
      return "Four of a Kind!"
    elsif cards.flush?
      return "Flush."
    elsif cards.straight?
      return "Straight"
    elsif cards.three_of_kind?
      return "Three of a kind"
    elsif cards.two_pair
      return "Two Pair"
    elsif cards.pair?
      return "Pair"
    else
      return "High Card: " + high_card(cards).to_s
    end
  end

end

# cards = Poker.new(["2 of Diamonds", "3 of Diamonds", "4 of Diamonds", "6 of Diamonds", "5 of Diamonds"])
