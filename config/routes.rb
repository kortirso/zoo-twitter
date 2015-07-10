Rails.application.routes.draw do

	devise_for :users
	get ':username' => 'twitter#account', as: 'account'
	post '' => 'twitter#create'
	root to: 'twitter#index', as: 'tweets'
	match "*path", to: "application#catch_404", via: :all

end
