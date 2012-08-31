Ooo::Application.routes.draw do
  get "pages/home"
  get "pages/contact"
  get "pages/about"
  get "pages/buttsize"
  get "pages/select"
  get "pages/northpole"
  get "pages/pop"
  get "pages/scardeypants"
  get "pages/spinforriches"
  get "pages/kerplunk"
  get "pages/kerplunk2"
  get "pages/kerplunk3"
  get "pages/blimp"
  get "pages/brainiacs"
  get "pages/darknessdive"
  get "pages/creeperkeeper"
  get "pages/tightropeterror"
  get "pages/yoshi"
  get "pages/yoshitask3"
  post "pages/house"
  post "pages/home"
  post "pages/contact"
  post "pages/about"
  post "pages/buttsize"
  post "pages/select"
  post "pages/northpole"
  post "pages/pop"
  post "pages/scardeypants"
  post "pages/spinforriches"
  post "pages/kerplunk"
  post "pages/kerplunk2"
  post "pages/kerplunk3"
  post "pages/blimp"
  post "pages/brainiacs"
  post "pages/darknessdive"
  post "pages/creeperkeeper"
  post "pages/tightropeterror"
  post "pages/yoshi"
  post "pages/yoshitask3"
  delete "pages/brainiacs"
  post "pages/trade"
  post "pages/realityTV"
  get "pages/hangglider"
  get "pages/ontheline"
  get "pages/coconutcatch"
  get "pages/geyserguess"
  get "pages/totemhop"
  get "pages/test"
  post "pages/poptropolis"
  get "pages/mainstreet"
  get "pages/archery"
  get "pages/diving"
  get "pages/hurdles"
  get "pages/javelin"
  get "pages/longjump"
  get "pages/polevault"
  get "pages/powerlifting"
  get "pages/shotput"
  get "pages/triplejump"
  get "pages/saveroom"
  get "pages/cp"
  get "pages/scaredypants"
  get "pages/nameroom"
  get "pages/commonroom"
  get "pages/turtleshelltoss"
  get "pages/realitymain"
  get "pages/motelroom"
  get "pages/moteloffice"
  get "pages/market"
  get "pages/TVworld"
  get "pages/skin"
  get "pages/hair"
  get "pages/diaryofawimpykid"
  get "pages/mountainrace"
  get "pages/bettyjetty"
  get "pages/tutorial"
  get "pages/paramstest"
  post "pages/paramstest"
  get "pages/problem"
  post "pages/problem"
  get "pages/testinput"
  get "pages/createfile"
  get "pages/testdir"
  get "lord_of_the_rings/testdownload"
  get "stuff_to_download/santa"
  get "pages/testmail"
  get "pages/te"
  post "pages/te"
  get "pages/display"
  post "pages/display"
  get "pages/execute"
  post "pages/execute"
  get "pages/noescape"
  get "pages/arithmetic"
  post "pages/arithmetic"
  match "/home", :to => "pages#home"
  match "/contact", :to => "pages#contact"
  match "/about", :to => "pages#about"
  match "/buttsize", :to => "pages#buttsize"
  match "/waiting_room", :to => "pages#brainiacs"
  match "/leave_site_and_go_sailing", :to => "pages#trade"
  match "/welcome", :to => "pages#nameroom"
  match "/", :to => "pages#brainiacs"
  match "/text_editor", :to => "pages#te"
  match "/race", :to => "pages#kerplunk"
  match "/race2", :to => "pages#kerplunk2"
  match "/race3", :to => "pages#kerplunk3"
  match "/display", :to => "pages#display"
  match "/HTML_viewer", :to => "pages#display"
  match "/execute", :to => "pages#execute"
  match "/search", :to => "pages#yoshi"
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
