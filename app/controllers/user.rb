get "/users" do
  @users = Users.all
  erb :"/users/index"
end

get "/users/new" do
  erb :"/users/new"
end

post "/users" do
  @user = User.find(username: params[:username], email: params[:email])
end
