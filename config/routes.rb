Rails.application.routes.draw do
  resources :users do
    resources :sticky_notes
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  root to: "sticky_notes#index"
end
