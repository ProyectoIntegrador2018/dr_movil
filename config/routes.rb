Rails.application.routes.draw do
  devise_for :doctors, path: 'doctors', controllers: { sessions: "doctors/sessions" }
  devise_for :patients, path: 'patients', controllers: { sessions: "patients/sessions", registrations: "patients/registrations" }

  resources :doctors
  resources :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
