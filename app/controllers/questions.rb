# CREATE
get '/questions/new' do
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.new(user_id: 1, title: params[:title], content: params[:content])

  # add back: user_id: session[:user_id],
  if @question.save
    redirect '/questions'
  else
    @errors = @question.errors.full_messages
    redirect '/questions/new'
  end
end

# READ
# show ALL
get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end
#show ONE
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/show'
end

# UPDATE
get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :"/questions/edit"
end

put '/questions/:id' do  # response to clicking button
  @question = Question.find(params[:id])
  if @question.update_attributes(title: params[:title], content: params[:content])
    redirect "/questions/#{params[:id]}"
  else
    @errors = @questions.errors.full_messages
    erb :"/questions/edit" # need to erb errors otherwise, errors instance variable will get lost
  end
end

# DELETE
delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
end
