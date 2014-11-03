# before '/turns/:turn_id' do
#   if params[:turn_id] != Turn.all.order(:id).last.id
#     redirect "/turns/#{Turn.all.order(:id).last.id}"
#   end
# end

#whyyyyyyyy

post '/turns' do
  user = User.find(session[:user_id])
  if user.turns.nil?
    @deck = Deck.find(params[:deck_id])
    current_cards = @deck.cards.shuffle
    @turn = Turn.create!(player_id: session[:user_id], card: current_cards.shift)
  else
    @deck = Deck.find(params[:deck_id])
    current_cards = @deck.cards.shuffle
  @turn = Turn.create!(player_id: session[:user_id], card: current_cards.shift)
  end
  redirect "/turns/#{@turn.id}"
end

#   if session[:turns_to_complete].nil?



get '/turns/:turn_id' do
  @turn = Turn.find(params[:turn_id])
  @deck = Deck.find(@turn.card.deck.id)
  if @last_turn = Turn.find(params[:turn_id].to_i - 1)
    if @last_turn.card.correct?(params[:guess])
      session[:message] = "Correct!"
    else
      session[:message] = "Sorry, that's incorrect!"
    end
  end
  erb :'/turns/show'
end

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
