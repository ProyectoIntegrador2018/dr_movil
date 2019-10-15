class AddSingularMedicalVariable < ActiveRecord::Migration[5.2]
  def change
    remove_column :patient_medicals, :medical_variables_id
    add_reference :patient_medicals, :medical_variable, foreign_key: true
  end
end
