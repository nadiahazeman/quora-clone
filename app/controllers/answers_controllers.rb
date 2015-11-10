helpers SessionHelper

# render new form
# get '/answers/new' do
get '/questions/:q_id/answers/new' do
	@user = current_user
  @question = Question.find_by(id: params[:q_id])
  erb :'answers/new'
end


# creating the answer
post '/answers' do
  @answer = current_user.answers.create(params[:answer])
  erb :'answers/show'  
end  

# show ALL answers
get '/answers/list' do
  @user = current_user
  @answer = @user.answers
  erb :'answers/list'
end  

# show the answer
get '/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  erb :'answers/show'
end


# render the edit form
get '/answers/:id/edit' do
  @answer = Answer.find_by(id: params[:id])
  erb :'answers/edit'
end

# update the answer
put '/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  if @answer.update(params[:answer])
    redirect to "/answers/#{@answer.id}"
  else
    erb :'answers/edit'
  end
end

# delete the answer
delete '/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  @answer.destroy
  redirect to '/dashboard'
end


