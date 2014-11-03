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
    @turn = Turn.create!(player_id: session[:user_id], card: current_cards.sample)
  else
    @deck = Turn.find(params[:turn_id]).card.deck
    current_card = @deck.cards.sample
    @turn = Turn.create!(player_id: session[:user_id], card: current_card)
  end
      if @turn.card.correct?(params[:guess])
        session[:message] = "Correct!"
      else
        session[:message] = "Sorry, that's incorrect!"
      end
  redirect "/turns/#{@turn.id}"
end



get '/turns/:turn_id' do
  @turn = Turn.find(params[:turn_id])
  @deck = Deck.find(@turn.card.deck.id)
  erb :'/turns/show'
end
