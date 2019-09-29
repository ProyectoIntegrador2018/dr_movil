class ViewablePatientsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :viewable_patients do |t|
      t.references :patient, foreign_key: true
      t.references :doctor, foreign_key: true
    end
  end
end
