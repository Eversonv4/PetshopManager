Rails.application.routes.draw do
  resources :products do
    collection do
      get :upload_csv
      post :import_csv
    end
  end
  resources :categories
  resources :appointments do
    collection do
      get :load_animals
    end
  end

  get "favorite/index"
  get "cart/index"
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Render dynamic PWA files from app/views/pwa/*

  # Defines the root path route ("/")
  root "home#index"

  devise_for :users
  # Defines the "about-us" path route ("/about-us")
  get "about-us" => "about_us#index", as: :about_us
  get "contact" => "contact#index", as: :contact
  get "shop" => "shop#index", as: :shop
  get "patient_area" => "patient_area#index", as: :patient_area

  resources :animals do
    get "animals" => "animals#index"
  end

  namespace :admin do
    resources :users, only: [ :new, :create ]
  end
end
