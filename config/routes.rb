Rails.application.routes.draw do
  resources :carts do
    member do
      post 'add_product'
      delete 'remove_product'
      get 'items'
      delete 'empty'
    end
  end
end
