class Encuesta < ApplicationRecord
  has_many :encuesta_patient
  has_many :patient, through: :encuesta_patient
end
