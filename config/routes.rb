Rails.application.routes.draw do
 
  

  root to: "home#index"  

  # Admin Rails
  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  
  # DEVISE
  devise_for :admins

  namespace :admin do # Added this configuration so admin gos to admin/client when cresting a new client instead of going to clinet home page
    resources :clients
    resources :users, only: [:index, :show]
  end

  devise_for :clients
  devise_for :users

  # CLIENTS and KONTESTS
  resources :clients do
    resources :kontests, shallow: true
  end

  # USERS
  get '/user/' => 'users#show', as: :user_show
  get '/user/edit' => 'users#edit',  as: :edit_user
  patch '/user' => 'users#update', as: :user_update
  get '/registercode' => 'users#registercode', as: :registercode
  post '/registercode' => 'users#addcode', as: :add_code
  get '/result' => 'users#result', as: :result

  # These routes take me to the home of every user, client, admin
  get '/homeadmin' => 'homeadmin#index', as: :indexadmin
  get '/homeuser' => 'homeuser#index', as: :indexuser
  get '/homeclient' => 'homeclient#index', as: :indexclient
  
  

  
    
  
  


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
