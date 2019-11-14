# Patient Medical Variables Controller controlls or actions regarding Medical Variable records

class MedicalVariablesController < ApplicationController
  before_action :check_doctor

  def index
    @medical_variables = MedicalVariable.all
  end

  def new
    @medical_variable = MedicalVariable.new
  end

  def create
    @medical_variable = MedicalVariable.new(medical_variable_params)
    if @medical_variable.save
      flash[:success] = 'Variable registrada exitosamente'
      redirect_to medical_variables_path
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :new
    end
  end

  def show
    @medical_variable = MedicalVariable.find(params[:id])
  end

  def edit
    @medical_variable = MedicalVariable.find(params[:id])
  end

  def update
    @medical_variable = MedicalVariable.find(params[:id])
    if @medical_variable.update(medical_variable_params)
      flash[:success] = 'Variable actualizada exitosamente'
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
    end
    redirect_to @medical_variable
  end

  private

  def medical_variable_params
    params.require(:medical_variable).permit(:name, :description)
  end

  def check_doctor
    redirect_to root_path unless (current_patient.nil? && current_doctor)
  end
end