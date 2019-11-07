# Encuesta Controller controlls or actions regarding Encuestas

class EncuestasController < ApplicationController

  # index
  # Funcion utilizada para mostrar todas las encuestas, se tiene opciones de
  # asignara (para asignar a un paciente del doc) y de eliminar para retirar la encuesta.
  def index
    @encuestas = Encuesta.all
  end

  # show
  # Funcion utilizada para mostrar los detalles de la encuesta.
  # También se utilizará para mostrar todos los pacientes a los que se les puede asignar
  # dicha encuesta.
  def show

  end

  # new
  # Funcion uilizada al momento de crear una nueva encuesta.
  def new
    @encuesta = Encuesta.new
  end

  # create
  # Funcion utilizada para crear una encuesta nueva dependiendo de los parametros mandados por new
  def create
    @encuesta = Encuesta.new(patient_params)
    if @encuesta.save
      flash[:success] = 'Encuesta registrada exitosamente'
      redirect_to encuestasA_path
    else
      flash.now[:error] = 'Hubo un error con el registro,
                           verifica los campos del formulario'
      render :new
    end
  end

  # destroy
  # Funcion utilizada para eliminar una encuesta
  def destroy

  end

  private

end
