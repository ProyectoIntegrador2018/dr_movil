# Patient Medical Controller controlls or actions regarding Patient Medical records

class PatientMedicalsController < ApplicationController
  before_action :check_doctor

  def index
    @patient = Patient.find(params[:patient])
    @medicals = PatientMedical.where(patient: @patient)
  end

  def new
    @patient = Patient.find(params[:patient_medical][:patient_id]) if params.has_key?(:patient_medical)
    @patient = Patient.find(params[:patient]) if @patient.nil?
    @registered_variables = @patient.registered_variables
    @unregistered_variables = @patient.unregistered_variables
    @patient_medical = PatientMedical.new
  end

  def edit
    @patient = Patient.find(params[:patient_medical][:patient_id]) if params.has_key?(:patient_medical)
    @patient = Patient.find(params[:patient]) if @patient.nil?
    @patient_medical = PatientMedical.find(params[:id])
    @medical_variable = @patient_medical.medical_variable
  end

  def create
    @patient = Patient.find(params[:patient_medical][:patient_id]) if params.has_key?(:patient_medical)
    @patient = Patient.find(params[:patient]) if @patient.nil?
    @registered_variables = @patient.registered_variables
    @unregistered_variables = @patient.unregistered_variables
    @patient_medical = PatientMedical.new(patient_medical_params)
    if @patient_medical.save
      flash[:success] = 'Variable asignada a paciente exitosamente'
      redirect_to patient_medicals_path(patient: @patient)
    else
      @patient_medical.errors.full_messages
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :new
    end
  end

  def update
    @patient = Patient.find(params[:patient_medical][:patient_id]) if params.has_key?(:patient_medical)
    @patient = Patient.find(params[:patient]) if @patient.nil?
    @patient_medical = PatientMedical.new(patient_medical_params)
    @patient_medical = PatientMedical.find(params[:id])
    if @patient_medical.update(patient_medical_params)
      flash[:success] = 'Variable asignada a paciente exitosamente'
      redirect_to patient_medicals_path(patient: @patient.id)
    else
      @patient_medical.errors.full_messages
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      redirect_to edit_patient_medical_path(@patient_medical, patient: @patient.id)
    end
  end

  private

  def patient_medical_params
    params.require(:patient_medical).permit(:patient_id, :freq, :medical_variable_id, :patient)
  end

  def check_doctor
    @patient = Patient.find(params[:patient_medical][:patient_id]) if params.has_key?(:patient_medical)
    @patient = Patient.find(params[:patient]) if @patient.nil?
    unless (current_patient.nil? && current_doctor.has_patient(@patient) || @patient.doctor == current_doctor) || current_patient == @patient
      redirect_to root_path
    end
  end
end
