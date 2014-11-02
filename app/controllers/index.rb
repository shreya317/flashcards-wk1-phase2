get '/' do
  erb :index
end

# get '/users/stats' do
#   erb :"users/stats"
# end

get '/sessions/new' do
  erb :"sessions/new"
end

post "/sessions" do
  user_credentials = params[:user]
  @user = User.find_by(email: user_credentials[:email])
  if @user.authenticate(user_credentials[:password])
    session[:user_id] = @user.id
    erb :"users/stats"
  else
    redirect "/"
  end
end

# post '/sessions' do
#   if @user = User.find_by(params[:email])
#     # we already have the user, no need to find it again in login instance method
#     if @user.login(params[:password])
#       session[:user_id] = @user.id
#       @owned_decks = @user.owned_decks
#       redirect '/users/stats'
#     else
#       redirect '/'
#     end
#   end
# end

delete '/sessions' do
  session.clear
  redirect '/'
end

get '/users/new' do
  erb :"users/new"
end

post "/users" do
  @user = User.create(params[:user])
  session[:user_id] = @user.id
  erb :index
end

# post '/users' do
#   # we are getting params[:user] which contains a hash with email password, so this doesn't work
#   binding.pry
#   user = params[:user]
#   @user = User.new(user[:email])
#   @user.password = user[:password]
#   if @user.save!
#     @user.login(params[:password])
#     session[:user_id] = @user.id
#     redirect '/users'
#   else
#     redirect '/'
#   end
# end
