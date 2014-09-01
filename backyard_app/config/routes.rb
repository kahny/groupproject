Rails.application.routes.draw do

  get 'session/new'

  get 'session/create'

  get 'session/destroy'

  root to: "site#index"

  get "/rentals", to: "rentals#index", as: "browse"

  get "/about", to: "site#about", as: "about"

  get "/contact", to: "site#contact", as: "contact"

  resources :users do
      resources :reviews
      resources :rentals
  end

end
