Rails.application.routes.draw do

  resources :journalpayments
  get 'techprocess/payment'
  post 'techprocess/pay' => "techprocess#pay"
  post 'payment_details/tp'
  get 'techprocess/apipost' => "techprocess#apipost"







  get 'dashboard/dash'
  post 'dashboard/accept'
  post 'dashboard/reject'
  post 'dashboard/revision'
  
  get 'dashboard/pdf'

  resources :verifications, except: [:show, :edit,:index]
  post 'verifications' => 'verifications#create'
  put 'verifications' => 'verifications#verify'
  resources :journals
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :papers
  # get "credits" => "static_pages#credits"
  # get "download_doc" => "static_pages#download_doc"
  resources :payment_details, except: [:show, :destroy, :update,:edit]
devise_for :user, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # get "selection" => "static_pages#selection"
  # get "sign_in" => "devise/sessions#new"
  get "home" => "static_pages#home"
  get "call_for_papers" => "static_pages#call_for_papers"
  get "important_dates" => "static_pages#important_dates"
  get "publications" => "static_pages#publications"
  # get "paper_ethics" => "static_pages#paper_ethics"
  get "commitee" => "static_pages#commitee"
  get "venue_and_contact" => "static_pages#venue_and_contact"
  get "pdf" => "payment_details#pdf"
  get "brochure" => "static_pages#brochure"
  get "schedule" => "static_pages#schedule"
  get "download_pdf" => "payment_details#download_pdf"
  get "paper_template" => "static_pages#paper_temp"
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'static_pages#home'

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
