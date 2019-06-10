Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  devise_scope :user do
    get 'users/show', to: 'users/registrations#show'
  end

  root to: 'pages#home'
  get 'help', to: 'pages#help'

  get 'secret_codes', to: 'secret_code#index'
  post 'secret_codes', to: 'secret_code#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
