class CreateMedicalVariables < ActiveRecord::Migration[5.2]
  def change
    create_table :medical_variables do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
