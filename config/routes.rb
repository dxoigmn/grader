ActionController::Routing::Routes.draw do |map|
  map.resources :assignments do |assignments|
    assignments.resources :criteria, :except => :index
  end
  
  map.resources :students do |students|
    students.resources :assignments, :only => :show do |assignments|
      assignments.resource :mark, :only => :show, :member => { :email => :get }
      assignments.resources :criteria, :only => :none do |criteria|
        criteria.resource :mark, :only => [:edit, :update, :create]
      end
    end
  end
  
  map.root :students
end
