WolfHowl::Application.routes.draw do

  resource :sessions, :only => [:new, :create, :destroy]

  resources :users, :only => [:new, :create, :show, :edit, :update]

  # namespace :circle do
  #   resources :groups do
  #     member do
  #       put 'set_admin/:user_id', :action => :set_admin
  #       put 'canel_admin/:user_id', :action => :canel_admin
  #     end
  #     resources :group_users, :only => [:create] 

  #     resources :budgets
  #     resources :accounts
  #     resources :activities do 
  #       resources :activity_users, :only => [:create]
  #       resources :budgets
  #       resources :accounts
  #     end    
  #   end
  # end

  namespace :personal do
    resources :users, :only =>[:edit,:update] do
      resources :budgets
      resources :accounts
      # resources :groups
      resources :activities do 
        resources :budgets
        resources :accounts
      end
    end
  end


  # namespace :admin do
  #   resources :budgets
    
  #   resources :accounts

  #   resources :group_users

  #   resources :categories

  #   resources :groups

  #   resources :users

  #   resource :sessions

  #   root :to => "home#index"
  # end

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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
