Rails.application.routes.draw do
  scope module: 'api', defaults: { format: 'json' } do
    namespace :v1 do
      resources :frameworks do
        resources :tutorials, only: [:create, :update]
      end
      resources :tutorials, except: [:create, :update] do
        resources :comments, only: [:create, :update, :destroy]
        resources :likes, only: [:create, :destroy]
      end
    end
  end
end
