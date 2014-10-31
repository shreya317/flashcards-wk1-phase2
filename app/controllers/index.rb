before '/secrets/:secret' do
  redirect '/' unless User.find(session[:user_id])
end


get '/' do
  erb :index
end

get '/secrets/secret' do
  erb :secret
end

get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  if @user = User.find_by(params[:email])
    if @user.login(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect '/secrets/secret'
    else
      redirect '/'
    end
  end
end

delete '/sessions' do
  session.clear
  redirect '/'
end

get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:email])
  @user.password = params[:password]
  if @user.save!
    @user.login(params[:email], params[:password])
    session[:user_id] = @user.id
    redirect '/secrets/secret'
  else
    redirect '/'
  end
end
