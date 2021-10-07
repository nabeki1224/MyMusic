Rails.application.routes.draw do
  scope module: :end_users do
    devise_for :end_users, controllers: {
        sessions: 'end_users/sessions',
        registrations: 'end_users/registrations',
        passwords: 'end_users/passwords'
    }
    root "home#top"

    get "/about" => "home#about"
    get '/auth/:provider/callback', to: 'twitters#create'
    get '/logout', to: 'twitters#destroy'
    get 'tracks/search'
    get 'tracks/:collection_id/:track_id', to: 'tracks#show', as: "track"
    post 'tracks/:collection_id/:track_id/mylists', to: 'mylists#create', as: "new_mylist"
    delete 'tracks/:collection_id/:track_id/mylists', to: 'mylists#destroy', as: "destroy_mylist"
    resources :mylists, only:[:show]
    resources :end_users, only:[:show, :edit, :update, :index] do
        member do
            get :following
            get :follower
        end
        get :search, on: :collection
    end
    resources :relationships, only: [:create, :destroy]
    get '/deactivate' => "end_users#deactivate"
    resources :posts, only: [:create, :dsetroy, :show, :index]
  end
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
