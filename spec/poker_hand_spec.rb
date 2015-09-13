require('rspec')
require('poker_hand')

describe('PokerHand') do
  before{
    @random = PokerHand.new(['Ace of Diamonds', '2 of Hearts', 'Jack of Diamonds', 'King of Spades', '8 of Spades'])
    @royal_flush = PokerHand.new(['10 of Diamonds', 'Jack of Diamonds', 'Queen of Diamonds', 'King of Diamonds', 'Ace of Diamonds'])
    @straight_flush = PokerHand.new(['8 of Diamonds', '7 of Diamonds', '6 of Diamonds', '5 of Diamonds', '4 of Diamonds'])
  }
  describe('initialize') do
    it("will return error message of hand has too many cards") do
      expect{ PokerHand.new(['Ace of Diamonds', '2 of Hearts', 'Jack of Diamonds', 'King of Spades', '8 of Spades', 'Ace of Spades']) }.to raise_error(ArgumentError)
    end
  end
  describe('cards_reminder') do
    it("will return a string of the card input seperated by commas") do
        expect(@random.cards_reminder()).to(eq('Your hand: Ace of Diamonds, 2 of Hearts, Jack of Diamonds, King of Spades, 8 of Spades'))
    end
  end
  describe('change_cards') do
    it("will return card objects from user input strings") do
      expect(@random.change_cards()).to(eq([{number:1, suit:2}, {number:2, suit:1}, {number:11, suit:2}, {number:13, suit:4}, {number:8, suit:4}]))
    end
  end

  describe('royal_flush?') do
    it('will return true if the hand has the same suit') do
      expect(@royal_flush.royal_flush?).to(eq(true))
    end
    it('will return false if the hand does not have a royal flush') do
      expect(@random.royal_flush?).to(eq(false))
    end
    it('will return false if the hand has the same suit but wrong type') do
      expect(@straight_flush.royal_flush?).to(eq(false))
    end
  end
end
