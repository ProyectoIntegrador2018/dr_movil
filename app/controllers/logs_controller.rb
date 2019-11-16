# Logs Controller controlls or actions regarding Logs records

class LogsController < ApplicationController
  # before_action :check_doctor

  def index
    @patient = current_patient.nil? ? Patient.find(params[:patient]) : current_patient
    @logs = Log.all.map{|log| log if log.patient_medical.patient == @patient }
  end

  def new
    @patient = current_patient.nil? ? Patient.find(params[:patient]) : current_patient
    @log = Log.new
  end

  def create
    @patient = current_patient.nil? ? Patient.find(params[:patient]) : current_patient
    @log = Log.new(log_params)
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
end