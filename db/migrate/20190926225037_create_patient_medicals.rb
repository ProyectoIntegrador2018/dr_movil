class CreatePatientMedicals < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_medicals do |t|
      t.references :patient, foreign_key: true
      t.references :medical_variables, foreign_key: true
      t.integer :freq

      t.timestamps
    end
  end
end
