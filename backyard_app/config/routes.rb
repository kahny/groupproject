Rails.application.routes.draw do

  root to: "site#index"

  get "/rentals", to: "rentals#index", as: "browse"

  resources :users do
      resources :reviews
      resources :rentals
  end

end
