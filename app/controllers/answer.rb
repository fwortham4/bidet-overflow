before do
  @errors = []
end

get "/questions/:id/answers/new" do
  @question = Question.find(params[:id])

  erb :"/answers/new"
end

post "/questions/:q_id/answers" do

  @answer = Answer.new(content: params[:content], question_id: params[:q_id], user_id: session[:user_id])

  if @answer.save
    redirect "/questions/#{params[:q_id]}"
  else
    @error = @answer.errors.full_message
    erb :"/answers/new"
  end
end