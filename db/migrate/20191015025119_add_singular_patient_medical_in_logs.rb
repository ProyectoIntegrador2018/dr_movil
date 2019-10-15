class AddSingularPatientMedicalInLogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :logs, :patient_medicals_id
    add_reference :logs, :patient_medical, foreign_key: true
  end
end
