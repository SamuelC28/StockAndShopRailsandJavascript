Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  
  get '/signin' => 'sessions#signin', as: 'signin_session'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout_session'

  resources :users, only: [:show,:new, :create]
  resources :addresses
  # resources :line_items
  # resources :carts
  resources :items
  resources :categories  
  
  

get 'carts/:id' => "carts#show", as: "cart"
delete 'carts/:id' => "carts#destroy"

post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
# post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
post 'line_items' => "line_items#create"
get 'line_items/:id' => "line_items#show", as: "line_item"
delete 'line_items/:id' => "line_items#destroy"

# delete 'items/:id' => "items#remove_item_from(cart)"

get 'stock_report/', to: "categories#stock_report"
resources :orders

post '/add_item/:item_id' => 'items#add_item', :as => 'add_item'
delete 'item/:id' => "items#destroy"

get '/auth/facebook/callback', to: 'sessions#create'

end


# ..........

#  root "static_pages#home"
#   get "/signin", to: "sessions#new"
#   post "/sessions/create", to: "sessions#create"
#   delete "/signout", to: "sessions#destroy"
#   post "/rides/new", to: "rides#new"
#   resources :attractions
#   resources :users