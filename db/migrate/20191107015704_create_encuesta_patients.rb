class CreateEncuestaPatients < ActiveRecord::Migration[5.2]
  def change
    create_table :encuesta_patients do |t|
      t.references :encuesta, foreign_key: true
      t.references :patients, foreign_key: true
      t.timestamps
    end
  end
end
