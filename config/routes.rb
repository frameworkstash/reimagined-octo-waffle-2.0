Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  scope module: 'api', defaults: { format: 'json' } do
    namespace :v1 do
      post '/auth/login', to: 'authentication#authenticate'
      # resources :user, only: [:show, :update, :destroy]
      get '/user', to: 'users#show'
      resources :profiles, param: :username, only: [:show]
      resources :frameworks do
        resources :tutorials, only: [:create, :update]
      end
      resources :tutorials, param: :slug, except: [:edit, :new] do
        resources :comments, only: [:create, :update, :destroy]
        resources :likes, only: [:create, :destroy]
        member do
          post 'upvote'
        end
      end
    end
  end
end
