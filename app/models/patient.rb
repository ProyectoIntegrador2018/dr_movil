# frozen_string_literal: true

# Patients have information relevant for the Doctors

class Patient < ApplicationRecord
  has_many :medical_consultation
  has_many :doctors, through: :viewable_patients
  has_many :patient_medicals
  has_many :encuesta_patient
  has_many :encuesta, through: :encuesta_patient
  belongs_to :doctor

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def viewable_doctors
    ViewablePatient.where(patient: self).map{|vp| vp.doctor }
  end
end
