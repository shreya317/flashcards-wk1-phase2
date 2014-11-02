# post '/turns' do
#   if params[:turn_id].nil?
#     deck = Deck.find(params[:deck_id])
#     deck.start_game
#   else
#     deck = Turn.find(params[:turn_id]).card.deck
#   @turn = Turn.create(player: sessions[:user_id], card: deck.get_next_card)
#   redirect :"/turns/#{@turn.id}"
#   end
# end



# get '/turns/:turn_id' do

#   @current_deck = Deck.find_by(name: "Ruby Basics").cards.to_a
#   @current_deck.get_next_card
#   # @current_card = @current_deck.shift
#   @turn = Turn.create!(player: User.all.first, card: @current_card)
#   # @turn = Turn.create(player: sessions[:user_id], card: deck.get_next_card)

#   erb :'/turns/show'

# end

# post '/turns' do
#   @current_card = Card.new
#   if @current_card.answer == params[:user_guess]
#   # if @current_card.check_guess(params[:user_guess])


#     # session[:correct_message] = "Correct!"
#     redirect :"/turns/:turn_id"
#   else
#     # puts "Incorrect"
#     # session[:incorrect_meesage] = "Sorry, that's incorrect!"
#     # redirect :'/turns/new'
#   end
# # take input from user
# # check guess
# # add card to played_cards
# # redirect to turns/new
# end
