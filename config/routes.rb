Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  root to: "pages#home"

  resources :report_templates do
    resource :reports, only: [:new, :create]
    end

  resources :reports, only: [:index, :show, :destroy, :update, :edit] do
    resources :report_entries, only: [:create]
    member do
      post :analyze
    end
  end

  resources :report_entries, except: [:create]
  resources :companies
  resources :users, only: [:create, :edit, :update]

  resources :impersonations, only: %i[create destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "about", to: "pages#about"
  get "main", to: "pages#main"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
