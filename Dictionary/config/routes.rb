Rails.application.routes.draw do
  resources :categories
  #resources :synonymous
  #resources :meanings
  resources :words

  root to: 'words#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
