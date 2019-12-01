class Encuesta < ApplicationRecord
  belongs_to :doctor
  has_many :encuesta_patient, dependent: :destroy
  has_many :patients, through: :encuesta_patient
end
