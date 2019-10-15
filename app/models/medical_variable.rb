# frozen_string_literal: true

#  Medical Variable has many patient medicals
class MedicalVariable < ApplicationRecord
  has_many :patient_medicals
end
