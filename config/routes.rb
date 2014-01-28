ProjectManagerApp::Application.routes.draw do

  devise_for :users
  resources :projects do
    get :favorites, on: :collection

    resources :tasks

    post 'vote_up' => 'votes#vote_up'
    post 'vote_down' => 'votes#vote_down'
    delete 'vote_delete' => 'vote#votes_delete'

  end

  resources :discussions do
    get :like, on: :member
    post :flag, on: :member

    resources :replies

  end




  #this was for temp log in
  # resources :users do
  #   get :login, on: :collection
  #   get :logout, on: :collection
  # end

  get 'comic' => 'comic#index'
  get 'comic/1' => 'comic#index'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
  #       project 'toggle'
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
  #     project 'toggle'
  #   end
  #   resources :projects, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
