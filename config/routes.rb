Rails.application.routes.draw do
  scope module: 'api', defaults: { format: 'json' } do
    namespace :v1 do
      resources :tutorials
      resources :frameworks, only: [:get, :show]
      resources :levels, only: [:get]
    end
  end
end
