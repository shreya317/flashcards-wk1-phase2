get "/" do
  erb :"index"
end

get '/sessions' do
  erb :"sessions/new"
end

post "/sessions" do
  user_credentials = params[:user]
  @user = User.find_by(email: user_credentials[:email])
  if @user.authenticate(user_credentials[:password])
    session[:user_id] = @user.id
    redirect "/decks"
  else
    redirect "/"
  end
end

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
  redirect "/decks"
end

get "/logout" do
  session.clear
  redirect "/"
end


