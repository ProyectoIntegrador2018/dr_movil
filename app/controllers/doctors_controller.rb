# Doctor Controller controlls or actions regarding Doctor User Types

class DoctorsController < ApplicationController
  before_action :validate_permission, only: %i[edit update destroy show]

  def index; end

  def new
    @doctor = Doctor.new
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      flash[:success] = 'Doctor registrado exitosamente'
      redirect_to doctors_path
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :new
    end
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update(doctor_params)
      flash[:success] = 'Información actualizada exitosamente'
      redirect_to @doctor
    else
      flash.now[:error] = 'Hubo un error con el registro, verifica los campos del formulario'
      render :edit
    end
  end

  def show
    @doctor = current_doctor
    @patients = @doctor.patients
    @viewable_patients = @doctor.viewable_patients
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    flash[:destroy] = 'Doctor eliminado exitosamente'
    redirect_to doctors_path
  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :birth_date, :sex, :email, :password, :password_confirmation)
  end

  def validate_permission
    redirect_to root_path if current_doctor.id.to_s != params[:id]
  end
end
