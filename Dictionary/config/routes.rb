Rails.application.routes.draw do
  resources :synonymous
  resources :meanings
  resources :words
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
