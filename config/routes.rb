Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  scope module: 'api', defaults: { format: 'json' } do
    namespace :v1 do
      post '/login', to: 'sessions#create'
      get '/users/:id', to: 'users#show'
      resources :users, only: [:update, :destroy]
      resources :frameworks do
        resources :tutorials, only: [:create, :update]
      end
      resources :tutorials, except: [:create, :update] do
        resources :comments, only: [:create, :update, :destroy]
        # resources :likes, only: [:create, :destroy]
        member do
          post 'upvote'
        end
      end
    end
  end
end
