class PacientMedical < ApplicationRecord
  belongs_to :patient
  belongs_to :medical_var
end
