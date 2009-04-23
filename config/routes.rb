ActionController::Routing::Routes.draw do |map|
  map.resources :assignments do |assignments|
    assignments.resources :criteria
  end
  
  map.resources :students
  map.resources :grades, :member => { :email => :get }
  
  map.root :students
end
