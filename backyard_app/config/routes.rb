Rails.application.routes.draw do

  root to: "site#index"

  get "/login", to: "session#new"

  post "login", to: "session#create"

  delete "/logout", to: "session#destroy"

  get "/logout", to: "session#destroy" #TO DO: delete this before production

  get "/signup", to: "users#new"

  # this might not be necessary
  get "/rentals", to: "rentals#index", as: "browse"

  get "/about", to: "site#about", as: "about"

  get "/contact", to: "site#contact", as: "contact"

  resources :users do
      resources :reviews
      resources :rentals
  end

end
