#get '/new_recipe', to: 'recipes#generate'
#  post '/generate_recipe', to: 'recipes#generate'
#  get '/recipe/:id', to: 'recipes#show', as: 'recipe'

# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  
  resources :subscriptions, only: [:new, :create]
  resources :recipes, only: [:new, :create, :show, :index] do
    post :generate, on: :collection
  end  

  get 'payment', to: 'subscriptions#payment', as: 'payment'

  root 'recipes#index'
end

