Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :stores
      resources :products
    end
  end
end
