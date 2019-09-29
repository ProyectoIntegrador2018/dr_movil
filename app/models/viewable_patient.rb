# frozen_string_literal: true

# Middle table for checking what Patients
# can share info to which doctors

class ViewablePatient < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
end
