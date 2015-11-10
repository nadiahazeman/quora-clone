helpers SessionHelper

post '/signin' do
	@user = User.authenticate(params[:email], params[:password])
	if @user
		session[:user_id] = @user.id
		redirect to "/users/#{@user.id}"
	else
		@message = "Email or password is invalid"
		erb :"static/index"
	end		
end

get "/users/:id" do
	@questions = Question.all
	@user = current_user
	erb :"static/dashboard"
end


get "/logout" do
	logout_user
	redirect to '/'
end
