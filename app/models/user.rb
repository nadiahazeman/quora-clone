class User < ActiveRecord::Base
	
	has_many :questions
	has_many :answers
	has_many :questionvotes
	has_many :answervotes


	validates :email, uniqueness: true, 
			  presence: true

	validates :password, presence: true, allow_blank:


	def	self.authenticate(email,password)
		
		existing_user = User.find_by(email: email, password: password) || nil
	end
end

