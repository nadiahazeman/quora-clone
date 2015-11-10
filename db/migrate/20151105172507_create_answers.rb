class CreateAnswers < ActiveRecord::Migration
	def change
		create_table :answers do |a|
			a.text :body
			a.integer :user_id
			a.timestamps
		end	
	end
end
