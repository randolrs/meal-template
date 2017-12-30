Rails.application.routes.draw do
  resources :meal_templates
  devise_for :users
  root 'pages#home'

  get 'pages/home'

  get '/login/', to: 'pages#login', as: 'login'
  get '/signup/', to: 'pages#signup', as: 'signup'

  get '/payments/', to: 'pages#payments', as: 'payments'

  post '/payments/', to: 'pages#create_payment_method', as: 'create_payment_method'

  get '/meal_templates/embed/:id', to: 'meal_templates#show_embed', as: 'show_embed'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
