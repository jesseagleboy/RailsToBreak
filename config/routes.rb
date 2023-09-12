Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "posts#index"
  get '/users/sign_out', to: 'posts#manual_logout'
  get '/posts/sign_up', to: 'posts#manual_signup'
  get '/posts/sign_in', to: 'posts#manual_sign_in'
  get '/users/logged_in', to: 'posts#logged_in_info'

  resources :posts

  

  # Defines the root path route ("/")
  # root "articles#index"
end
