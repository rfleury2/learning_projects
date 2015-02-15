class Deck
  attr_accessor :cards
  def initialize(options = {})
    @cards = []
    generate_cards
  end

  private

  def generate_cards
    suits = ['spades', 'clubs', 'hearts', 'diamonds']
    suits.each do |suit|
      (2..14).each do |value|
        cards << Card.new({:value => value, :suit => suit})
      end
    end
  end
end

class Card
  attr_reader :value, :suit, :display_value
  def initialize(card_object = {:value => value, :suit => suit})
    @value = card_object[:value]
    @suit = card_object[:suit]
    @display_value = display_value_creator
  end

  private

  def display_value_creator
    return value if value <= 10
    case value
    when 11
      return 'jack'
    when 12
      return 'queen'
    when 13
      return 'king'
    when 14
      return 'ace'
    end
  end
end

# deck = Deck.new()
# p deck.cards

## Features to add
# Euchre deck
# Joker true/false
