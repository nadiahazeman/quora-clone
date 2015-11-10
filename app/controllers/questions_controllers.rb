helpers SessionHelper

# render new form
get '/questions/new' do
	@user = current_user
  @question = Question.find_by(id: params[:id])
  erb :'questions/new'
end

# creating the question
post '/questions' do
  @question = current_user.questions.create(params[:question])
  erb :'questions/show'  
end

#show ALL questions
get'/questions/list' do
  @user = current_user
  @question = @user.questions
  erb :'questions/list'
end  

# show the question
get '/questions/:id' do
  @user = current_user
  @question = find_question
  @user_question = User.find_by(id: @question.user_id)
  # @question = Question.find_by(id: params[:id])
  @answers = Answer.where(question_id: params[:id])
  erb :'questions/show'
end

#vote for question

post '/questions/:id/vote' do
  @user = current_user
  byebug
  @question = find_question
  @question_vote = Questionvote.new(params[:questionvote])
  @question_vote.save
  redirect to "/questions/#{@question.id}"
end  

# render the edit form
get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/edit'
end

# update the question
put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  if @question.update(params[:question])
    redirect to "/questions/#{@question.id}"
  else
    erb :'questions/edit'
  end
end

# delete the question
delete '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.destroy
  redirect to '/dashboard'
end

