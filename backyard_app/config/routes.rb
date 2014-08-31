Rails.application.routes.draw do

  resources :users do
      resources :reviews
      resources :rentals
  end

end
