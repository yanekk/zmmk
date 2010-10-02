Zmmk::Application.routes.draw do |map|
  devise_for :users

  resources :lesson_modules, :except => [:show] do
    collection do
      put "update_order"
    end

    resources :activations, :only => [:update, :destroy], :controller => "LessonModuleActivations"

    resources :assignments do
      collection do
        put "update_order"
      end
      member do
        put "copy"
      end
      resources :activations, :only => [:update, :destroy], :controller => "AssignmentActivations"
    end
  end

  root :to => "lesson_modules#index"
end

