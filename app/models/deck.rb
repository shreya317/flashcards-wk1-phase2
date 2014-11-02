class Deck < ActiveRecord::Base
  has_many :cards

  def start_game
    @current_deck = self.cards.to_a.shuffle
  end

  def get_next_card
    @current_deck.shift
  end

  def complete?
      @current_deck.empty?
  end

end
