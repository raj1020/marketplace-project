Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "pages#home", as: "root"


  
  get "/cooks", to: "cooks#index", as: "cooks"
  get "/cooks/order", to: "cooks#order", as: "order"

  get "/cooks/new", to: "cooks#new", as: "new_cook"
  post "/cooks/new", to: "cooks#create"
  get "/cooks/:id", to: "cooks#show", as: "cook"
  get "/cooks/:id/edit", to: "cooks#edit", as: "edit_cook"
  patch 'cooks/:id', to: 'cooks#update'

  
  
  delete "/cooks/:id", to: "cooks#destroy", as: "delete"

  get "/orders/success", to: "orders#success", as: "success_order"
  post "/orders/webhook", to: "orders#webhook", as: "payorder"
  
  

end
