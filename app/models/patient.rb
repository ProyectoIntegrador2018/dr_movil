# frozen_string_literal: true

# Patients have information relevant for the Doctors

class Patient < ApplicationRecord
  has_many :medical_consultation
  has_many :doctors, through: :viewable_patients
  has_many :patient_medicals
  belongs_to :doctor

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def viewable_doctors
    ViewablePatient.where(patient: self).map{|vp| vp.doctor }
  end

  def registered_variables
    return PatientMedical.where(patient: self).map{|pm| pm.medical_variable} 
  end

  def unregistered_variables
    return MedicalVariable.all - PatientMedical.where(patient: self).map{|pm| pm.medical_variable} 
  end

  def variables_with_patient_medical
    return self.patient_medicals.map {|pm| [pm.medical_variable.name.titleize, pm.id] }
  end
end
