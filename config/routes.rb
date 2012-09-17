# WEB PET
if File.exists?("started")
  WEBrick = Class.new Exception
  WEBrick::Utils = Object.new
  WEBrick::HTTPServer = Class.new Exception
else
  File.open "started", "w" do |f|
    f.write "DO NOT DELETE THIS FILE UNTIL THE SERVER HAS STOPPED RUNNING!!!"
  end
end
if Rails.env.web_pet?
class NilClass
  def method_missing(methodSymbol, *other_stuff)
    WebPet.new("[not implemented]").send methodSymbol, *other_stuff
  end
  def to_ary
    [nil]
  end
  def to_str
    "nil"
  end
end
class WebPet
  #def puts(*stuff)
  #  @log += "#{stuff.join("")}\n"
  #end
  
  def self.action(do_what)
    $pet.send(do_what)
  end
  
  def new(name="[not implemented]")
    $pet = self.class.new(name)
  end
  
  def call(*params)
    "RING! RING! RING! #{params.join(" ")}!"
  end
  
  def to_hash
    {:answer => self}
  end
  
  def initialize(name="[not implemented]")
    @title = "create"
    @log = String.new
    @name  = name
    @number = name.to_f
    @asleep = false #They aren't asleep.
    @stuffInBelly     = 10  #They're full.
    @stuffInIntestine =  0  #They don't need to go.
    @love = 1
    @money = 100
    
    puts @name+' is born.'
  end
  
  def feed
    @title = "feed"
    puts 'You feed '+@name+'.'
    @stuffInBelly = 10 #you feed them
    @love = @love+3
    passageOfTime
  end
  
  def walk
    @title = "walk"
    puts 'You walk '+@name+'.'
    @stuffInIntestine = 0 #pet has a chance to poo
    @love = @love+2
    passageOfTime
  end
  
  def putToBed
    @title = "put to bed"
    puts 'You put '+@name+' to bed.'
    @asleep = true #pet falls asleep
    @love = @love+1
    3.times do
      if @asleep
        passageOfTime
      end
      if @asleep
        puts @name+' smiles.'
      end
    end
    if @asleep
      @asleep = false #pet wakes up
      puts @name+' wakes up slowly.'
    end
  end
  
  def love
    @title = "love"
    puts 'You say to '+@name+', "I love you".'
    puts @name+' smiles.'
    @love = @love+5
    passageOfTime
  end
  
  def rock
    @title = "rock"
    puts 'You rock '+@name+' gently.'
    @asleep = true #pet falls asleep
    @love = @love+4
    puts @name+' briefly dozes off...'
    passageOfTime
    if @asleep
      @asleep = false #pet wakes up
      puts '...but wakes when you stop.'
    end
  end
  
  def method_missing(methodSymbol, *other_stuff)
    self
  end
  
  def stats
    @title = "stats"
    puts "NAME: "+@name
    puts "STUFFINBELLY: "+@stuffInBelly.to_s
    puts "STUFFININTESTINE: "+@stuffInIntestine.to_s
    puts "ASLEEP: "+@asleep.to_s
    puts "LOVE: "+@love.to_s
    print "BONDED: "
    if bonded?
    puts "true"
    else
    puts "false"
    end
    puts "MONEY: $"+@money.to_s
  end
  def log
    @title = "LOG"
  end
  
  private
  
  #"private" means that the methods defined here are methods internal to the object.  (You can feed your pet, but you can't ask them if they're hungry.)
  
  def hungry?
    #Method names can end with "?".
    #Usually, we only do this if the method returns true or false, like this:
    @stuffInBelly <= 2
  end
  def bonded?
    @love >= 100
  end
  def poopy?
    @stuffInIntestine >= 8
  end
  
  def passageOfTime
    if @stuffInBelly > 0
      #food moves along
      @stuffInBelly     = @stuffInBelly   - 1
      @stuffInIntestine = @stuffInIntestine+1
      @love = @love+1
    else  #UH-OH
      if @asleep
        @asleep = false #pet wakes up
        puts @name+' wakes up suddenly!'
      end
      puts @name+"'s starving! "+@name+" must search for food elsewhere!\a"
      exit
    end
    
    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      @money = @money - 20
      puts  @name+" couldn't hold it any longer and has just had an accident pay $20 for clean-up agents.\nYou now have:\n$"+@money.to_s
    end
    if @money <= 0
      puts "You're broke! Now you can still pay but you will have negative money I'll show you...\n$"+@money.to_s
    end
    if hungry?
      if @asleep
        @asleep = false #pet wakes up
        puts @name+' wakes up suddenly!'
      end
      puts @name+"'s stomach grumbles..."
    end
    
    if poopy?
      if @asleep
        @asleep = false #pet wakes up
        puts @name+' wakes up suddenly!'
      end
      puts @name+' does the potty dance...'
    end
    if bonded?
      @bonded = true
    else
      @bonded = false
    end
  end
  
end
$pet ||= WebPet
WebPetController = WebPet
end
# REAL WORLD
Ooo::Application.routes.draw do
  resources :sessions, :only => [:new, :create, :destroy]
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts, :only => [:create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  
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
  get "pages/filebrowser"
  post "pages/filebrowser"
  get "pages/execute_sh"
  post "pages/execute_sh"
  get "pages/css"
  get "web_pet/new"
  get "web_pet/log"
  get "web_pet/feed"
  get "web_pet/walk"
  get "web_pet/put_to_bed"
  get "web_pet/love"
  get "web_pet/rock"
  get "web_pet/stats"
  match "/signup", :to => "users#new"
  match "/signin", :to => "sessions#new"
  match "/signout", :to => "sessions#destroy"
  match "/home", :to => "pages#home"
  match "/contact", :to => "pages#contact"
  match "/about", :to => "pages#about"
  match "/buttsize", :to => "pages#buttsize"
  match "/waiting_room", :to => "pages#brainiacs"
  match "/leave_site_and_go_sailing", :to => "pages#trade"
  match "/welcome", :to => "pages#nameroom"
  root :to => "pages#brainiacs"
  match "/text_editor", :to => "pages#te"
  match "/race", :to => "pages#kerplunk"
  match "/race2", :to => "pages#kerplunk2"
  match "/race3", :to => "pages#kerplunk3"
  match "/display", :to => "pages#display"
  match "/HTML_viewer", :to => "pages#display"
  match "/execute", :to => "pages#execute"
  match "/search", :to => "pages#yoshi"
  match "/execute_sh", :to => "pages#execute_sh"
  match "/filebrowser", :to => "pages#filebrowser"
  match "/get_rid_of_user", :to => "users#destroy"
  match "/application.css", :to => "pages#css" unless Rails.env.development?
  match "/get_rid_of_micropost", :to => "microposts#destroy"
  WeBrick = WEBrick
  WEBrick::HttpServerController = WEBrick::HTTPServer
  match "/mess_stuff_up", :to => "WEBrick::HTTPServer#start" # comment out if causing problems
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
