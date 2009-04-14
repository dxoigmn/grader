ActionController::Routing::Routes.draw do |map|
  map.resources :assignments, :has_many => :questions
  map.resources :students
  map.resources :grades
end
