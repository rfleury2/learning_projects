require_relative 'playing_cards_model'

describe Deck do
  let(:deck) { Deck.new() }

  describe '#cards' do
    it 'cards is an array' do
      expect(deck.cards).to be_a Array
    end

    it 'each card is a Card' do
      expect(deck.cards.sample).to be_a Card
    end

    it 'there are 4 of each value' do
      check_value = (2..14).to_a.sample
      expect(deck.cards.count{|card| card.value == check_value}).to eq(4)
    end

    it 'there are 13 of each suit' do
      check_suit = ['spades', 'clubs', 'hearts', 'diamonds'].sample
      expect(deck.cards.count{|card| card.suit == check_suit}).to eq(13)
    end
  end

  describe ':joker = true' do
    let(:joker_deck) { Deck.new({:joker => true}) }

    it 'there should be 54 cards' do
      expect(joker_deck.cards.length).to eq 54
    end

    it 'there should be two jokers' do
      expect(joker_deck.cards.count{ |card| card.suit == 'joker' }).to eq 2
    end
  end
end