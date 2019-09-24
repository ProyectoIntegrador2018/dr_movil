class PacientMedical < ApplicationRecord
  belongs_to :pacient
  belongs_to :medical_var
end
