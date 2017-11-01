Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :reviews, only: [ :new, :create ]
    collection do                       # collection => no restaurant id in URL
      get '/top', to: "restaurants#top"  # RestaurantsController#top
    end
  end

  resources :reviews, only: [ :edit, :update ]
  root "restaurants#index"
end
