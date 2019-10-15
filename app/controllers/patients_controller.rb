
class PatientsController < ApplicationController
  before_action :authenticate_doctor!, only: [:new, :create]
  before_action :check_doctor, except: %i[index]

  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:success] = 'Paciente registrado exitosamente'
      redirect_to patients_path
    else
      flash.now[:error] = 'Hubo un error con el registro,
                           verifica los campos del formulario'
      render :new
    end
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      flash[:success] = 'Información actualizada exitosamente'
      redirect_to @patient
    else
      flash.now[:error] = 'Hubo un error con el registro,
                           verifica los campos del formulario'
      render :new
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    flash[:destroy] = 'Paciente eliminado exitosamente'
    redirect_to patients_path
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :birth_date,
                                    :sex, :email, :doctor_id, :password,
                                    :password_confirmation)
  end

  def check_doctor
    @patient = Patient.find(params[:id])
    unless (current_patient.nil? && current_doctor.has_patient(@patient) || @patient.doctor == current_doctor) || current_patient == @patient
      redirect_to root_path
    end
  end
end
