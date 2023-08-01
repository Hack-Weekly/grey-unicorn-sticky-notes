Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  root to: "dashboard#index"

  resources :workspaces do
    resources :whiteboards
  end
  resources :sticky_notes, except: [:index]

end
