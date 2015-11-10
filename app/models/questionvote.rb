class Questionvote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :question
	validates :value, presence: true
end
