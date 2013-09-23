ExampleApp::Application.routes.draw do
  resources :notes, except: :show

  resources :posts, except: :show do
    collection do
      get :search
      get :reindex
    end
  end

  resources :tags, only: [:index, :create, :destroy]

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root "home#index"
end
