ActionController::Routing::Routes.draw do |map|
  map.resources :photos
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.root :controller => "game"
end
