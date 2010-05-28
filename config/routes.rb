ActionController::Routing::Routes.draw do |map|
  map.resources :courses, :has_many => :holes
  map.resources :rounds, :has_many => :round_holes
  
  # Stats
  map.stats '/stats', :controller => 'stats', :action => 'index'

  # Application home page
  map.root :controller => "courses"

  # URL format
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
