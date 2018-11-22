Rails.application.routes.draw do
  resources :line_items
  resources :carts
  get 'catalog/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  root 'catalog#index'
end
