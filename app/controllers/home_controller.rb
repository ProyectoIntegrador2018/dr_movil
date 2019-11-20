class HomeController < ApplicationController
  def index
    if current_patient.nil? && current_doctor
      redirect_to current_doctor
    elsif current_patient && current_doctor.nil?
      redirect_to current_patient
    end
  end
end
