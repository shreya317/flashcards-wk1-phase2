get "/decks/:deck_id" do
	@deck = Deck.find(params[:deck_id])
	@all_cards = @deck.cards.all
	@user = User.find(session[:user_id])
	erb :"decks/show"
end