ActionController::Routing::Routes.draw do |map|
  map.resources :assignments do |assignments|
    assignments.resources :questions, :except => :index
  end
  
  map.resources :students
end
