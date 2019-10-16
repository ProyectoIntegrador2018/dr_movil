# Patient Medical Controller controlls or actions regarding Patient Medical records

class MedicalController < ApplicationController
  before_action :check_doctor

  def index
    @medicals = PatientMedical.where(patient: params[:patient])
    @patient = Patient.find(params[:patient])
  end

  def update
    PatientMedical.find(params[:medical]).update_attribute(:freq, params[:freq])
    redirect_to action: "index", patient: params[:patient]
  end

  def check_doctor
    @patient = Patient.find(params[:patient])
    unless (current_patient.nil? && current_doctor.has_patient(@patient) || @patient.doctor == current_doctor) || current_patient == @patient
      redirect_to root_path
    end
  end
end
