Rails.application.routes.draw do

	devise_for :users
	get 'locale/:name' => 'twitter#locale', as: 'change_locale'
	get ':username' => 'twitter#account', as: 'account'
	post '' => 'tweet#create'
	root to: 'twitter#index', as: 'tweets'
	match "*path", to: "application#catch_404", via: :all

end
