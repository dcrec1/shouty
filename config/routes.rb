ActionController::Routing::Routes.draw do |map|
  map.resources :shouties, :collection => { :fetch => :get }

  map.home   '/home',   :controller => 'application',   :action => 'home'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  map.login  '/login',  :controller => 'user_sessions', :action => 'new'
  map.signup '/signup', :controller => 'users',         :action => 'new'
  
  map.resource :user_sessions
  map.resources :users

  map.root :controller => :shouties
end
