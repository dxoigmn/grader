ActionController::Routing::Routes.draw do |map|
  map.resources :assignments do |assignments|
    assignments.resources :questions, :except => :index
  end
  
  map.resources :students do |students|
    students.resources :assignments, :only => :show do |assignments|
      assignments.resources :questions, :only => :none do |questions|
        questions.resource :grade, :only => [:edit, :update, :create]
      end
    end
  end
end
