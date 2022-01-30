Rails.application.routes.draw do
  namespace :end_users do
    get 'mysingers/index'
    get 'mysingers/create'
  end
  get 'mysingers/create'
  get 'mysingers/index'
  get 'mysingers/follower'
  namespace :end_users do
    get 'chats/index'
    get 'chats/show'
  end
  scope module: :end_users do
    devise_for :end_users, controllers: {
        sessions: 'end_users/sessions',
        registrations: 'end_users/registrations',
        passwords: 'end_users/passwords',
    }
    root "home#top"

    get "/about" => "home#about"
    get 'tracks/search'
    get 'tracks/:artist_id/:collection_id/:track_id', to: 'tracks#show', as: "track"
    post 'tracks/:artist_id/:collection_id/:track_id/mylists', to: 'mylists#create', as: "new_mylist"
    delete 'tracks/:artist_id/:collection_id/:track_id/mylists', to: 'mylists#destroy', as: "destroy_mylist"
    post 'tracks/:artist_id/:collection_id/:track_id', to: 'tracks#create', as: "new_track"
    delete 'tracks/:artist_id/:collection_id/:track_id', to: 'tracks#destroy', as: "destroy_track"
    get 'artists/:artist_id', to: 'artists#show', as: "artist"
    get 'artists/:artist_id/follower', to: 'artists#follower', as: "artist_follower"
  
    resources :mylists, only:[:show]
    resources :end_users, only:[:show, :edit, :update, :index] do
      resources :mysingers, only: [:create, :index, :destroy]

      member do
          get :following
          get :follower
      end
      # get :search, on: :collection
    end
    resources :relationships, only: [:create, :destroy]
    get '/deactivate' => "end_users#deactivate"
    resources :posts, only: [:create, :destroy, :show, :index]
    resources :chats
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
