class AddCountersToUser < ActiveRecord::Migration
    def change
        add_column :users, :followed_counter, :integer, default: 0
        add_column :users, :followers_counter, :integer, default: 0
    end
end
