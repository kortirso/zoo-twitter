class AddCounterToUser < ActiveRecord::Migration
	def change
		add_column :users, :tweets_counter, :integer, default: 0
	end
end
