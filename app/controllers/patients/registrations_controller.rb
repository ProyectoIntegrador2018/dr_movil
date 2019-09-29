# Class responsible of Patients type user
# devise Registrations (for creating new
# Patients users)

# frozen_string_literal: true

class Patients::RegistrationsController < Devise::RegistrationsController
  before_action :verify_doctor, only: [:new, :create, :destroy]

  def verify_doctor
    if current_doctor.nil?
      flash[:error] = 'Permisos insuficientes'
      redirect_to root_path
    end
  end
end
