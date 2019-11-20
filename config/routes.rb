Rails.application.routes.draw do
  get '/medical', to: 'medical#index'
  patch '/medical', to: 'medical#update'
  devise_for :doctors, path: 'doctors', controllers: { sessions: "doctors/sessions" }
  devise_for :patients, path: 'patients', controllers: { sessions: "patients/sessions" }, skip: [:registrations]

  resources :doctors
  resources :patients
  resources :patient_medicals
  resources :viewable_patients
  resources :medical_variables
  resources :logs
  post 'encuestas/new', to: 'encuestas#create', as: 'create_encuesta'
  resources :encuestas do
    resources :encuesta_patients, only: [:destroy]
  end
  post 'encuestas/:encuesta_id/encuesta_patients/:id', to: 'encuesta_patients#create', as: 'encuesta_encuesta_patients'
  get 'encuestas-patient', to: 'encuesta_patients#index', as: 'encuesta_patients_index'
  root to: "home#index"
end
