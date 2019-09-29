
class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def new
    @patient = Patient.new()
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:success] = "Paciente registrado exitosamente"
      redirect_to patients_path
    else
      flash.now[:error] = "Hubo un error con el registro, verifica los campos del formulario"
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
    params.require(:patient).permit(:first_name, :last_name, :birth_date, :sex, :email, :password, :password_confirmation)
  end
end
