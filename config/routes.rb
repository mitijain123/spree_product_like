Spree::Core::Engine.routes.draw do
  post 'like_product/:id', to: 'likes#like_product', as: 'like_product'
  delete 'unlike_product/:id', to: 'likes#unlike_product', as: 'unlike_product'
  get '/favourites', to: 'likes#index', as: 'products_favourites'
  namespace :admin do
    get '/products/products_ranking', as: 'products_ranking'
  end

  namespace :api, defaults: { format: 'json' } do
  	resources :likes
 	end
end
