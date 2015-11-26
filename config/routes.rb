Rails.application.routes.draw do

    resources :relationships, only: [:create, :destroy]
    devise_for :users
    get 'settings' => 'twitter#settings', as: 'settings'
    get 'locale/:name' => 'twitter#locale', as: 'change_locale'
    get ':username/following' => 'twitter#following', as: 'following'
    get ':username/followers' => 'twitter#followers', as: 'followers'
    get ':username' => 'twitter#account', as: 'account'
    post '' => 'tweet#create'
    root to: 'twitter#index', as: 'tweets'
    match "*path", to: "application#catch_404", via: :all

end
