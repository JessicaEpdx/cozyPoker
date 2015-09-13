require('rspec')
require('poker_hand')

describe('PokerHand') do
  before{
    @random = PokerHand.new(['Ace of Diamonds', '2 of Hearts', 'Jack of Diamonds', 'King of Spades', '8 of Spades'])
    @royal_flush = PokerHand.new(['10 of Diamonds', 'Jack of Diamonds', 'Queen of Diamonds', 'King of Diamonds', 'Ace of Diamonds'])
    @straight_flush = PokerHand.new(['8 of Diamonds', '7 of Diamonds', '6 of Diamonds', '5 of Diamonds', '4 of Diamonds'])
    @four_of_a_kind = PokerHand.new(["4 of Hearts", "4 of Diamonds", "4 of Spades", "2 of Diamonds", "4 of Clubs"])
    @three_of_a_kind = PokerHand.new(["4 of Hearts", "3 of Diamonds", "4 of Spades", "2 of Diamonds", "4 of Clubs"])
    @full_house = PokerHand.new(["4 of Hearts", "2 of Diamonds", "4 of Spades", "2 of Diamonds", "4 of Clubs"])
    @flush = PokerHand.new(["10 of Diamonds", "3 of Diamonds", "2 of Diamonds", "4 of Diamonds", "5 of Diamonds"])
    @straight = PokerHand.new(["10 of Hearts", "9 of Diamonds", "8 of Clubs", "7 of Diamonds", "6 of Diamonds"])
    @two_pair = PokerHand.new(["4 of Hearts", "2 of Diamonds", "4 of Spades", "2 of Diamonds", "5 of Clubs"])
    @pair = PokerHand.new(["4 of Hearts", "2 of Diamonds", "4 of Spades", "Ace of Diamonds", "King of Clubs"])
  }
  describe('initialize') do
    it("will return error message of hand has too many cards") do
      expect{ PokerHand.new(['Ace of Diamonds', '2 of Hearts', 'Jack of Diamonds', 'King of Spades', '8 of Spades', 'Ace of Spades']) }.to raise_error(ArgumentError)
    end
  end

  describe('change_cards') do
    it("will return card objects from user input strings") do
      expect(@random.change_cards()).to(eq([{number:1, suit:2}, {number:2, suit:1}, {number:11, suit:2}, {number:13, suit:4}, {number:8, suit:4}]))
    end
  end

  describe('get_best_hand') do
    it('will give best poker hand for hand given') do
      expect(@royal_flush.get_best_hand).to(eq("Royal Flush!"))
      expect(@straight_flush.get_best_hand).to(eq("Straight Flush!"))
      expect(@four_of_a_kind.get_best_hand).to(eq("Four of a Kind!"))
      expect(@full_house.get_best_hand).to(eq("Full House!"))
      expect(@flush.get_best_hand).to(eq("Flush."))
      expect(@straight.get_best_hand).to(eq("Straight."))
      expect(@three_of_a_kind.get_best_hand).to(eq("Three of a Kind."))
      expect(@two_pair.get_best_hand).to(eq("Two Pair."))
      expect(@pair.get_best_hand).to(eq("Pair."))
      expect(@random.get_best_hand).to(eq("High Card: King"))
    end
  end

  describe('royal_flush?') do
    it('will return true if the hand has the same suit and specific numbers') do
      expect(@royal_flush.royal_flush?).to(eq(true))
    end
    it('will return false if the hand does not have a royal flush') do
      expect(@random.royal_flush?).to(eq(false))
    end
    it('will return false if the hand has the same suit but wrong numbers') do
      expect(@straight_flush.royal_flush?).to(eq(false))
    end
  end

  describe('straight_flush?') do
    it('will return true if the hand has the same suit') do
      expect(@straight_flush.straight_flush?).to(eq(true))
    end
    it('will return false if the hand does not have a straight flush') do
      expect(@random.straight_flush?).to(eq(false))
    end
  end

  describe('four_of_a_kind?') do
    it('will return true if the hand has 4 cards with same number') do
      expect(@four_of_a_kind.four_of_a_kind?).to(eq(true))
    end
    it('will return false if the hand does not have 4 cards with same number') do
      expect(@random.four_of_a_kind?).to(eq(false))
    end
  end

  describe('full_house?') do
    it('will return true if the hand has both 3 of a kind and pair') do
      expect(@full_house.full_house?).to(eq(true))
    end
    it('will return false if the hand does not have both 3 of a kind and pair') do
      expect(@random.full_house?).to(eq(false))
    end
  end

  describe('flush?') do
    it('will return true if the hand has 5 cards of same suit') do
      expect(@flush.flush?).to(eq(true))
    end
    it('will return false if the hand does not have 5 cards of same suit') do
      expect(@random.flush?).to(eq(false))
    end
  end

  describe('straight?') do
    it('will return true if the hand has 5 sequential cards of different suits') do
      expect(@straight.straight?).to(eq(true))
    end
    it('will return false if the hand does not have 5 sequential cards of different suits') do
      expect(@random.straight?).to(eq(false))
    end
  end

  describe('three_of_a_kind?') do
    it('will return true if the hand has 3 cards of same number') do
      expect(@three_of_a_kind.three_of_a_kind?).to(eq(true))
    end
    it('will return false if the hand does not have 3 cards of same number') do
      expect(@random.three_of_a_kind?).to(eq(false))
    end
  end

  describe('two_pair?') do
    it('will return true if the hand has 2 pairs of 2 cards of same number') do
      expect(@two_pair.two_pair?).to(eq(true))
    end
    it('will return false if the hand does not have 2 pairs of 2 cards of same number') do
      expect(@random.two_pair?).to(eq(false))
    end
  end

  describe('pair?') do
    it('will return true if the hand has 2 cards of same number') do
      expect(@pair.pair?).to(eq(true))
    end
    it('will return false if the hand does not have 2 cards of same number') do
      expect(@random.pair?).to(eq(false))
    end
  end

  describe('high_card') do
    it('will return a string with name of the highest face card') do
      expect(@royal_flush.high_card).to(eq("King"))
    end
    it('will return a number if no face cards in hand') do
      expect(@two_pair.high_card).to(eq(5))
    end

  end
end
