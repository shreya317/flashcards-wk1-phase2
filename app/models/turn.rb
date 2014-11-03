class Turn < ActiveRecord::Base
  belongs_to :player, class_name: "User"
  belongs_to :card

  before_create :set_starting_values

  def set_starting_values
    self.correct_guesses = 0
    self.times_guessed = 0
  end

  def generate_turns

  end
end

  # if params[:turn_id].nil?
  #   deck = Deck.find(params[:deck_id])
    # remaining_turns = deck.cards.map {|card| Turn.create(player: user, card: card)}.shuffle
  # else

    # remaining_turns = user.turns.select {|turn| turn.card.deck.id == current_turn.card.deck.id}

  # end

    # rounds_completed = remaining_turns(:times_guessed).uniq.sort.first
    # session[:turns_to_complete] = starting_turns.where(times_guessed: rounds_completed)

