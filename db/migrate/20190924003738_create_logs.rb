class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.references :pacient_medical, foreign_key: true
      t.float :value

      t.timestamps
    end
  end
end
