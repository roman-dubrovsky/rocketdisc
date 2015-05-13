Rails.application.routes.draw do
  devise_for :users

  root 'pages#main'

  resources :contents, path: 'home', only: [:index, :show, :create, :destroy] do
    member do
      patch :proppatch
    end
    collection do
      post :mkcol
    end
  end

  resources :contents, path: 'home/:folder', as: 'folder_contents', only: [:index, :create] do
    collection do
      post :mkcol
      get :back
    end
  end
end
