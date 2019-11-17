# Logs Controller controlls or actions regarding Logs records

class LogsController < ApplicationController
  # before_action :check_doctor

  def index
    @patient = current_patient.nil? ? Patient.find(params[:patient]) : current_patient
    @logs = Log.all.map{|log| log if log.patient_medical.patient == @patient }.compact
    @tracked_variables = @patient.registered_variables
  end

  def new
    @patient = current_patient.nil? ? Patient.find(params[:patient]) : current_patient
    @log = Log.new
  end

  def create
    @patient = current_patient.nil? ? Patient.find(params[:patient]) : current_patient
    log_parameters = log_params
    log_parameters[:status] = calculate_status
    @log = Log.new(log_parameters)
    if @log.save
      flash[:success] = 'Variable registrada exitosamente'
      redirect_to logs_path
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :new
    end
  end

  def edit
    @patient = current_patient.nil? ? Patient.find(params[:patient]) : current_patient
    @log = Log.find(params[:id])
  end

  def update
    @patient = current_patient.nil? ? Patient.find(params[:patient]) : current_patient
    @log = Log.find(params[:id])
    if @log.update(log_params)
      flash[:success] = 'Variable actualizada exitosamente'
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
    end
    redirect_to @log
  end

  private

  def log_params
    params.require(:log).permit(:value, :patient_medical_id)
  end

  def check_patient
    redirect_to root_path unless (current_patient.nil? && current_doctor)
  end

  def calculate_status
    log_date = PatientMedical.find(params[:log][:patient_medical_id]).updated_at.to_date
    if (Date.today.year * 12 + Date.today.month) - (log_date.year * 12 + log_date.month) <= 1
      return "on time"
    else
      return "delayed"
    end
  end
end