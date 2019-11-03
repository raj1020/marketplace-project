Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/", to: "pages#home", as: "root"

  post "/pages", to: "pages#index"
  get "/pages", to: "pages#index", as: "order"

  post "/cooks", to: "cooks#details"
  get "/cooks", to: "cooks#details", as: "detail"

  

end
