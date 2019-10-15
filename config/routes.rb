Rails.application.routes.draw do
  get 'medical/show'
  devise_for :doctors, path: 'doctors', controllers: { sessions: "doctors/sessions" }
  devise_for :patients, path: 'patients', controllers: { sessions: "patients/sessions" }, skip: [:registrations]

  resources :doctors
  resources :patients
  resources :patient_medicals
  root to: "home#index"
end
