# CREATE
get '/questions/new' do
  erb :'/questions/new'
end

post '/questions/new' do
  @question = Question.new(user_id: params[:user_id], title: params[:title], content: params[:content])
  if @question.save
    redirect '/questions/index'
  else
    @errors = @question.errors.full_messages
    redirect '/questions/new'
  end
end

# READ
# show ONE
get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end
#show ALL
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'/questions/#{@question.id}'
end

# UPDATE
get '/questions/:id/edit' do
  erb :'/questions/#{params[:id]}/edit'
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  if @question.update_attributes(title: params[:title], content: params[:content])
    redirect '/questions/#{params[:id]}'
  else
    @errors = @questions.errors.full_messages
    redirect '/questions/#{params[:id]}/edit'
  end
end

# DELETE
delete '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
end
