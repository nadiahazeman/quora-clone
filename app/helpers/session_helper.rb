module SessionHelper #this is to seperate non-model business logics from MVC

	def current_user
		if session[:user_id]
			User.find(session[:user_id])
		else
		nil
		end
	end

	def logout_user
		session.delete :user
	end	

	def logged_in?
		!current_user.nil?
	end	

	def authenticate_user!

		redirect to "/" unless logged_in?
	end	

	def has_question?
		if current_user.questions.nil?
			@message = "You do not have any questions"
		else
			erb :'questions/list'
		end
	end

	def find_question
		Question.find_by(id: params[:id])
	end

	def find_answer
		@answer = Answer.find_by(id: params[:id])
	end

end
