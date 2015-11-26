class Tweet < ActiveRecord::Base
    validates :user_id, :text, presence: true
    validates :text, length: { maximum: 140 }
    belongs_to :user

    def self.from_users_followed_by(user)
        followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
        where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
    end
end
