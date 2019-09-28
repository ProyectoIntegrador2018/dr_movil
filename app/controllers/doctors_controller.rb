# Doctor Controller controlls or actions regarding Doctor User Types

class DoctorsController < ApplicationController
  def index; end

  def new
    @doctor = Doctor.new
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

  def show
    @doctor = Doctor.find(params[:id])
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
end
