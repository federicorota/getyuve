Rails.application.routes.draw do


  # Named routes for static pages
  get '/welcome', to: 'static_pages#welcome'
  get '/product', to: 'static_pages#product'
  get '/nutrition', to: 'static_pages#nutrition'
  get '/privacy_policy', to: 'static_pages#privacy_policy'
  get '/return_policy', to: 'static_pages#return_policy'
  get '/subscribed', to: 'static_pages#subscribed'
  get '/faq', to: 'static_pages#faq'
  get '/the_team', to: 'static_pages#the_team', :as => :the_team
  get '/blog', to: 'spree/blog_entries#index', :as => :blog

  # ckeditor
  mount Ckeditor::Engine => '/ckeditor'

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, :at => '/store'
          # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  Spree::Core::Engine.routes.draw do
    namespace :admin do
      resources :blog_entries
    end

    scope Spree::Config['blog_alias'], as: 'blog' do
      get '/tag/:tag' => 'blog_entries#tag', :as => :tag
      get '/category/:category' => 'blog_entries#category', :as => :category
      get '/author/:author' => 'blog_entries#author', :as => :author
      get '/:slug' => 'blog_entries#show', :as => :entry_permalink
      get '/:year(/:month)(/:day)' => 'blog_entries#archive', :as => :archive,
        :constraints => {:year => /(19|20)\d{2}/, :month => /[01]?\d/, :day => /[0-3]?\d/}
      get '/feed' => 'blog_entries#feed', :as => :feed, :format => :rss
      get '/' => 'blog_entries#index'
    end
  end

  # You can have the root of your site routed with "root"
  root 'static_pages#welcome'

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
