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
    puts self.get_best_hand
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
    new_cards = []
    numbers = [2, 3, 4, 5, 6, 7, 8, 9, 10]
    for card in cards do
      card_object = {number: 0, suit:0}
      for number in numbers
        if card.include? number.to_s
          card_object[:number] = number
        end
      end
      if card.include? "Jack"
        card_object[:number] = 11
      elsif card.include? "Queen"
        card_object[:number] = 12
      elsif card.include? "King"
        card_object[:number] = 13
      elsif card.include? "Ace"
        card_object[:number] = 1
      end
      if card.include? "Hearts"
        card_object[:suit] = 1
      elsif card.include? "Diamonds"
        card_object[:suit] = 2
      elsif card.include? "Clubs"
        card_object[:suit] = 3
      elsif card.include? "Spades"
        card_object[:suit] = 4
      end
      new_cards.push(card_object)
    end
    return new_cards
  end

  def sort_by_suit(cards)
  end

  def royal_flush?
    cards = self.change_cards
    cards.sort_by! do |card|
      card[:number]
    end
    suit_count = 0
    number_count = 0
    if cards[0][:number] == 1 && cards[0][:suit] == cards[1][:suit] && cards[1][:number] == 10
      number_count += 1
      suit_count += 1
    else
      return false
    end
    for i in 1..3
      puts cards[i][:number] + 1
      if cards[i][:suit] == cards[i+1][:suit] && cards[i][:number] + 1 == cards[i+1][:number]
        suit_count += 1
        number_count += 1
      end
    end
    return number_count == 4 && suit_count == 4
  end

  def straight_flush?
    cards = self.change_cards
    cards.sort_by! do |card|
      card[:number]
    end
    suit_count = 0
    number_count = 0
    for i in 0..3
      if cards[i][:suit] == cards[i+1][:suit] && cards[i][:number]+1 == cards[i+1][:number]
        suit_count += 1
        number_count += 1
      end
    end
    return suit_count == 4 && number_count == 4
  end

  def four_of_a_kind?
    four_of_a_kind = false
    cards = self.change_cards
    grouped = cards.group_by{ |c| c[:number] }
    keys = grouped.keys
    for key in keys
      if grouped[key].length == 4
        four_of_a_kind = true
      end
    end
    return four_of_a_kind
  end

  def full_house?
    three_of_a_kind = false
    pair = false
    cards = self.change_cards
    grouped = cards.group_by{ |c| c[:number] }
    keys = grouped.keys
    for key in keys
      if grouped[key].length == 3
        three_of_a_kind = true
      elsif grouped[key].length == 2
        pair = true
      end
    end
    return three_of_a_kind && pair
  end

  def flush?
    cards = self.change_cards
    suit_count = 0
    for i in 0..3
      if cards[i][:suit] == cards[i+1][:suit]
        suit_count += 1
      end
    end
    return suit_count == 4
  end

  def straight?
    cards = self.change_cards
    cards.sort_by! do |card|
      card[:number]
    end
    number_count = 0
    for i in 0..3
      if cards[i][:number]+1 == cards[i+1][:number]
        number_count += 1
      end
    end
    return number_count == 4
  end

  def three_of_a_kind?
    three_of_a_kind = false
    cards = self.change_cards
    grouped = cards.group_by{ |c| c[:number] }
    keys = grouped.keys
    for key in keys
      if grouped[key].length == 3
        three_of_a_kind = true
      end
    end
    return three_of_a_kind
  end

  def two_pair?
    pair_count = 0
    cards = self.change_cards
    grouped = cards.group_by{ |c| c[:number] }
    keys = grouped.keys
    for key in keys
      if grouped[key].length == 2
        pair_count += 1
      end
    end
    return pair_count == 2
  end

  def pair?
    pair = false
    cards = self.change_cards
    grouped = cards.group_by{ |c| c[:number] }
    keys = grouped.keys
    for key in keys
      if grouped[key].length == 2
        pair = true
      end
    end
    return pair
  end

  def high_card
    cards = self.change_cards
    high_card = 0
    for card in cards do
      if card[:number].to_i >= high_card.to_i
        high_card = card[:number].to_i
      end
    end
    if high_card == 11
      return "Jack"
    elsif high_card == 12
      return "Queen"
    elsif high_card == 13
      return "King"
    else
      return high_card
    end
  end

  def get_best_hand
    cards = self
    if cards.royal_flush?
      return "Royal Flush!"
    elsif cards.straight_flush?
      return "Straight Flush!"
    elsif cards.four_of_a_kind?
      return "Four of a Kind!"
    elsif cards.full_house?
      return "Full House!"
    elsif cards.flush?
      return "Flush."
    elsif cards.straight?
      return "Straight."
    elsif cards.three_of_a_kind?
      return "Three of a kind."
    elsif cards.two_pair?
      return "Two Pair."
    elsif cards.pair?
      return "Pair."
    else
      return "High Card: " + cards.high_card.to_s
    end
  end

end
royal_flush = Poker.new(["Ace of Diamonds", "King of Diamonds", "Jack of Diamonds", "Queen of Diamonds", "10 of Diamonds"])
straight_flush = Poker.new(["Ace of Diamonds", "3 of Diamonds", "2 of Diamonds", "4 of Diamonds", "5 of Diamonds"])
four_kind = Poker.new(["4 of Hearts", "4 of Diamonds", "4 of Spades", "2 of Diamonds", "4 of Clubs"])
three_kind = Poker.new(["4 of Hearts", "3 of Diamonds", "4 of Spades", "2 of Diamonds", "4 of Clubs"])
full_house = Poker.new(["4 of Hearts", "2 of Diamonds", "4 of Spades", "2 of Diamonds", "4 of Clubs"])
flush = Poker.new(["10 of Diamonds", "3 of Diamonds", "2 of Diamonds", "4 of Diamonds", "5 of Diamonds"])
straight = Poker.new(["10 of Hearts", "9 of Diamonds", "8 of Clubs", "7 of Diamonds", "6 of Diamonds"])
two_pair = Poker.new(["4 of Hearts", "2 of Diamonds", "4 of Spades", "2 of Diamonds", "5 of Clubs"])
pair = Poker.new(["4 of Hearts", "2 of Diamonds", "4 of Spades", "Ace of Diamonds", "King of Clubs"])
random_hand = Poker.new(["4 of Hearts", "2 of Diamonds", "7 of Spades", "Queen of Diamonds", "King of Clubs"])
