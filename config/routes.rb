BasicApp::Application.routes.draw do


  # resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  #URIs will look like /users/1/following and /users/1/followers


  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]


  #get "users/new"

  # get "static_pages/home"
  # get "static_pages/help"
  # get "static_pages/about"
  # get "static_pages/contact"

  root to: 'static_pages#home'

  #match '/', to: 'static_pages#home'
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/signup', to:'users#new'

  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete


  # HTTP
  # request  URI          Action    Named route           Purpose
  # ========================================================================================
  # GET     /users        index     users_path            page to list all users
  # GET     /users/1      show      user_path(user)       page to show user
  # GET     /users/new    new       new_user_path         page to make a new user (signup)
  # POST    /users        create    users_path            create a new user
  # GET     /users/1/edit edit      edit_user_path(user)  page to edit user with id 1
  # PUT     /users/1      update    user_path(user)       update user
  # DELETE  /users/1      destroy   user_path(user)       delete user



  # GET     /signin       new       signin_path           page for a new session (signin)
  # POST    /sessions     create    sessions_path         create a new session
  # DELETE  /signout      destroy   signout_path          delete a session (sign out)




  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
