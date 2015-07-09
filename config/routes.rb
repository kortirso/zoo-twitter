Rails.application.routes.draw do

	devise_for :users
	get ':username' => 'twitter#account', as: 'account'
	root to: 'twitter#index'
	match "*path", to: "application#catch_404", via: :all

end
