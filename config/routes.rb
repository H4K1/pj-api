Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :stores do 
        resources :products, only: [:index]
        resources :orders, only: [:index]
      end
      resources :products
      resources :orders 

    end
  end
end
