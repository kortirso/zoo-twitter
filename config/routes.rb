Rails.application.routes.draw do

	get ':account' => 'twitter#account', as: 'account'
	root to: 'twitter#index'
	match "*path", to: "application#catch_404", via: :all

end
