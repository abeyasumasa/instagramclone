Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :photos do
    collection do
      post :confirm
    end
  end
end
