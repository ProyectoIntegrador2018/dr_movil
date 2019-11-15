class CreateEncuesta < ActiveRecord::Migration[5.2]
  def change
    create_table :encuesta do |t|
      t.string :name
      t.string :url
      t.references :doctor, foreign_key: true
      t.timestamps
    end
  end
end
