Rails.application.routes.draw do
  resources :contacts
  root to: 'homes#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    collection do
      post :confirm
    end
  end
  resources :posts
  resources :favorites, only: [:create, :destroy]
  get '/confirmed/:id', to: 'posts#confirmed', as: 'confirmed'
  get '/confirm/:id', to: 'posts#confirm', as: 'confirm'
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unprocessable'
  get '/500', to: 'errors#internal_server'
  get '/users/:id/favorites', to: 'users#user_favorite', as: 'favor'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
