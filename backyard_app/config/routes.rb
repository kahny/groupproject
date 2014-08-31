Rails.application.routes.draw do

  get 'reviews/index'

  get 'rentals/index'

  get 'users/index'

  get 'user/index'

  resources :users do
      resources :reviews
      resources :rentals
  end

end
