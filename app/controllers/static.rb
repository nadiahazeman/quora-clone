helpers SessionHelper
require 'byebug'

get '/' do
	@user = current_user
  erb :"static/index"
end

post "/signup" do

	@new_user = User.new(params[:user])
	if @new_user.save!
		session[:user_id] = @new_user.id
		redirect '/dashboard'
	else
		erb :"static/index"
	end	
end

get "/dashboard" do

@questions = Question.all
@user = current_user
	erb :"static/dashboard"
end
