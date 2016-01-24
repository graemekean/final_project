Rails.application.routes.draw do
  

  get 'comment/show'

  get 'comment/edit'

  get 'comment/index'

  get 'comment/new'

  resources :posts

  get 'mixer/show'

  get 'statuses/index'

  get 'statuses/show'

  get 'statuses/edit'

  # get 'status/index'

  # get 'status/show'

  # get 'stem/index'

  # get 'stem/show'

  # get 'stem/edit'

  devise_for :users, controllers: { registrations: "registrations" }

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  resources :projects do
    resources :stems
  end
  resources :profile
  resources :statuses
  # resources :friendships
  resources :friendships do
    member do
      put :accept
    end
  end

  resources :conversations do
    resources :messages
   end

  resources :groups

  resources :stems
  resources :studio

  # get 'studios/index'
  # post 'studios/new'


  # get 'feed', to: 'statuses#index', as: :feed
  # get '/:id', to: 'profile#show', as: 'profile'
  # get 'studio/show'

  # get 'profile/show'

  # get '/:id', to: 'studio#show', as: 'studio'
  # post '/:id', to: 'profile#edit'


  root to: 'statuses#index'

  # get 'stem/index'
  # get 'stem/show'
  # get 'stem/edit'
  # get 'stem/delete'

 

  # get 'profiles/show'





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
