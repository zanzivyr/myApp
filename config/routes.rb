Rails.application.routes.draw do
  get 'store/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                     controllers: {
                        omniauth_callbacks: "omniauth_callbacks", 
                        registrations: "registrations"
                     }
  resources :users
  resources :posts
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root to: 'posts#index'
  root to: 'store#index'
end
