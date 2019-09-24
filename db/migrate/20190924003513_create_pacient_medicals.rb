class CreatePacientMedicals < ActiveRecord::Migration[5.2]
  def change
    create_table :pacient_medicals do |t|
      t.references :pacient, foreign_key: true
      t.references :medical_var, foreign_key: true
      t.integer :freq

      t.timestamps
    end
  end
end
