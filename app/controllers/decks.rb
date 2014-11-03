get '/decks'  do
  @user = User.find(session[:user_id])
  @decks = Deck.all
  erb :"decks/index"
end

get '/deck/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  erb :"decks/show"
end
