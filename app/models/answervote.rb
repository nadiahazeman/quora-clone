class Answervote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :answer
	validates :value, presence: true
end
