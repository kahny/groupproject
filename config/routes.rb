Rails.application.routes.draw do

  get 'search/index'

  get 'passwords/new'

  root to: "site#index"

  # get "/search",    to: "site#search", as: "search"

  get "/login",     to: "session#new"

  post "/login",    to: "session#create"

  delete "/logout", to: "session#destroy"

  get "/logout",    to: "session#destroy" #TO DO: delete this before production

  get "/signup",    to: "users#new"

  # this might not be necessary
  get "/rentals",   to: "rentals#index", as: "browse"
  get "/rentals",   to: "rentals#index", as: "rentals"
  get "/about",     to: "site#about", as: "about"

  get "/contact",   to: "site#contact", as: "contact"

  post "/users/:user_id/rentals/:rental_id/reviews",  to: "reviews#create"

  post "/password/:id", to: "passwords#update"

  resources :search

  resources :users do
      resources :reviews
      resources :rentals
  end

  resources :rentals do
    resources :agreements
  end

  resources :passwords

end
