class Deck < ActiveRecord::Base
  has_many :cards

  # def generate_new_turns(player_id)
  #   self.cards.map {|card| Turn.create(player_id: player_id, card: card)}.shuffle
  # end
end
