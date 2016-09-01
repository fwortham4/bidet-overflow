before do
  @errors = []
end

get "/users" do
  @users = Users.all
  erb :"/users/index"
end

get "/users/new" do
  erb :"/users/new"
end

post "/users/" do
  @user = User.new(user_name: params[:user_name], email: params[:email])
  @user.password = params[:password]
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :"/users/new"
  end
end

get '/users/:id' do
  authorized!
  @user = User.find(params[:id])
  erb :'/users/show'
end

