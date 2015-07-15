FactoryGirl.define do
	factory :tweet do
		text "Tweet's text"
		association :user
	end
end
