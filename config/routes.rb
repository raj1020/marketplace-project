Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "pages#home", as: "root"

  # get "/pages", to: "pages#index", as: "order"

  
  get "/cooks", to: "cooks#index", as: "cooks"
  get "/cooks/new", to: "cooks#new", as: "new_cook"
  post "/cooks/new", to: "cooks#create"
  get "/cooks/:id", to: "cooks#show", as: "cook"

  

end
