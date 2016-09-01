get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
 @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect :"/users/#{current_user.id}"
  else
    @errors = ["Email and password combination do not match"]
    erb :"/sessions/new"
  end
end

delete "/sessions/logout" do
  session[:user_id] = nil
  redirect "/"
end
