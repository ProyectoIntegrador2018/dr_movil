Rails.application.routes.draw do
  devise_for :doctors, path: 'doctors', controllers: { sessions: "doctors/sessions" }
  devise_for :patients, path: 'patients', controllers: { sessions: "patients/sessions" }

  resources :doctors
  resources :patients
  root to: "home#index"
end
