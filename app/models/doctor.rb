# frozen_string_literal: true

# Doctors visualize Patients and its information

class Doctor < ApplicationRecord
  has_many :medical_consultation
  has_many :patients, through: :viewable_patients
  has_many :patients
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def viewable_patients
    ViewablePatient.where(doctor: self).map{|vp| vp.patient }
  end

  def has_patient patient
    return viewable_patients.include?patient
  end
end
