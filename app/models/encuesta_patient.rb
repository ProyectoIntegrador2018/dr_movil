class EncuestaPatient < ApplicationRecord
  belongs_to :patient
  belongs_to :encuesta
end
