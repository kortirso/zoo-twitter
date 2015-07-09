class Tweet < ActiveRecord::Base
	validates :user_id, :text, presence: true
	validates :text, length: { maximum: 140 }
end
