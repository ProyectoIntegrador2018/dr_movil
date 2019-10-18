# Patient Viewable Patients Controller controlls or actions regarding Patient Medical records

class ViewablePatientsController < ApplicationController
  before_action :check_patient

  def index
    @viewable_patients = current_doctor.shared_patients
  end

  def new
    @viewable_patient = ViewablePatient.new
    @patients = patients
    @doctors = doctors
  end

  def create
    @viewable_patient = ViewablePatient.new(viewable_patient_params)
    if @viewable_patient.save
      flash[:success] = 'Permiso registrado exitosamente'
      redirect_to viewable_patients_path
    else
      flash.now[:error] = 'Hubo un error con el registro,
                           verifica los campos del formulario'
      render :new
    end
  end

  def destroy
    @viewable_patient = ViewablePatient.find(params[:id])
    @viewable_patient.destroy
    flash[:destroy] = 'Permiso eliminado exitosamente'
    redirect_to viewable_patients_path
  end

  private

  def viewable_patient_params
    params.require(:viewable_patient).permit(:doctor_id, :patient_id)
  end

  def check_patient
    redirect_to root_path unless current_patient.nil?
  end

  def patients
    current_doctor.patients.map { |p| ["#{p.first_name.titleize} #{p.last_name.titleize}", p.id] }
  end

  def doctors
    Doctor.where.not(id: current_doctor.id).map { |d| ["#{d.first_name.titleize} #{d.last_name.titleize}", d.id] }
  end
end