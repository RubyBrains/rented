Rails.application.routes.draw do
  resources :places
  resources :searches

  devise_for :users
  root 'homes#show'
  
  
end
