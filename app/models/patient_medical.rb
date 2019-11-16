# frozen_string_literal: true

# Doctors visualize Patient Medical records and its information
class PatientMedical < ApplicationRecord
  belongs_to :patient
  belongs_to :medical_variable
  has_many :logs
end
