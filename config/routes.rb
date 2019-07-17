Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :photos do
    collection do
      post :confirm
    end
  end
end
