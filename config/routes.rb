Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  root to: "dashboard#index"

  resources :sticky_notes, except: [:index]

  resources :workspaces do
    resources :whiteboards do
      resources :sticky_notes, except: [:index]
      get "/completed", to: "whiteboards#completed"
    end
  end
end
