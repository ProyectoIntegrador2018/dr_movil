Rails.application.routes.draw do
  devise_for :patients
  resources :patients

  root to: "home#index"
end
