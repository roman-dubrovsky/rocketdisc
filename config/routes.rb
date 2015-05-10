Rails.application.routes.draw do
  devise_for :users

  root 'pages#main'

  resources :contents, path: 'home', only: [] do
    member do
      patch :proppatch
    end
    collection do
      post :mkcol
    end
  end

  resources :contents, path: 'home', only: [:index, :show, :create, :destroy]
end
