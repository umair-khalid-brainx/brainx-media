Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :friends
  resources :users
  resources :posts do
    resources :reactions do
      collection do
        get :like
        get :dislike
      end
    end
  end
  resources :users, only: [:index, :show]

  resources :friend_requests do
    collection do
      get :create_friend_request
      get :accept_friend_request
    end
  end
end
