Rails.application.routes.draw do
  resources :products_lots do
    collection do
      post 'movements'
      post 'due_front'
      post 'due_method'
      post 'lote_front'
      post 'lote_method'
      get 'lote_by_product/:product_id' => 'products_lots#lote_by_product', as: :lote_by_product
      get 'empty_lots/:product_id' => 'products_lots#empty_lots', as: :empty_lots
    end
  end

  resources :businesses

  resources :drivers

  devise_for :users, :controllers => { :registrations => "users/registrations" }
  root 'main#index'
  get 'inbox_task' => 'main#inbox_task', as: :inbox_task_main
  get 'home' => 'main#home'
  post 'home' => 'main#home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  resources :clients
  resources :drivers
  resources :categories
  resources :suppliers
  resources :products
  resources :transports
  resources :stock_for_articles do
    collection do
      post 'movements'
      post 'due_front'
      post 'due_method'
      post 'lote_front'
      post 'lote_method'
    end
  end
  resources :contracts do
    collection do
      post 'add_item'
      post 'add_document'
    end
  end
  resources :remission_guides do
    collection do
      post 'add_item'
    end
  end
  resources :purchase_orders do
    collection do
      post 'add_item'
      post 'add_document'
    end
  end
  resources :vouchers do
    collection do
      post 'add_item'
    end
  end
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
