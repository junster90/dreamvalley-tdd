Rails.application.routes.draw do
  #home
  root to: 'home#index'

  #devise and omniauth
  get "login", to: redirect('auth/dreamvalley'), as: :login
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }, skip: [:sessions]

  as :user do
    get '/auth/mindvalley', :as => :new_user_session
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :goals, only: [:new, :create]
end
