class PatientMedical < ApplicationRecord
  belongs_to :patient
  belongs_to :medical_variable
end
