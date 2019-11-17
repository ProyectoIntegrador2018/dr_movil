# Encuesta Controller controlls or actions regarding Encuestas

class EncuestaPatientsController < ApplicationController
  def create
    @encuesta = EncuestaPatient.new
    @encuesta.patient_id = params[:id]
    @encuesta.encuesta_id = params[:encuesta_id]
    if @encuesta.save
      flash[:success] = 'Encuesta relacionada exitosamente.'
      redirect_to encuesta_path(params[:encuesta_id])
    else
      flash[:success] = "Hubo un error con el registro, contacte al administrador."
      redirect_to encuestas_path
    end
  end

  def destroy
    @encuesta = EncuestaPatient.where(encuesta_id: params[:encuesta_id], patient_id: params[:id]).first
    @encuesta.destroy
    flash[:destroy] = 'La encuesta ha sido removida de la vista del paciente.'
    redirect_to encuesta_path(params[:encuesta_id])
  end
end
