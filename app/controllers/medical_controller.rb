class MedicalController < ApplicationController
  before_action :check_doctor
  def index
    @medicals = PatientMedical.where(patient: params[:patient])
    @patient = Patient.find(params[:patient])
  end

  def check_doctor
    @patient = Patient.find(params[:patient])
    unless (current_patient.nil? && current_doctor.has_patient(@patient) || @patient.doctor == current_doctor) || current_patient == @patient
      redirect_to root_path
    end
  end
end
