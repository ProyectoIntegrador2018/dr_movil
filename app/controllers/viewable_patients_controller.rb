# Patient Viewable Patients Controller controlls or actions regarding Patient Medical records

class ViewablePatientsController < ApplicationController
  before_action :check_patient

  def index
    @viewable_patients = current_doctor.shared_patients
  end

  def check_patient
    redirect_to root_path unless current_patient.nil?
  end
end