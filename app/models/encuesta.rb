class Encuesta < ApplicationRecord
  belongs_to :doctor
  has_many :encuesta_patient
  has_many :patients, through: :encuesta_patient
end
