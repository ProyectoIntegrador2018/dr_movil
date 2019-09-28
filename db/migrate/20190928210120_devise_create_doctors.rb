# frozen_string_literal: true

class DeviseCreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      # Attributes
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :sex

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :doctors, :email,                unique: true
    add_index :doctors, :reset_password_token, unique: true
    # add_index :doctors, :confirmation_token,   unique: true
    # add_index :doctors, :unlock_token,         unique: true
  end
end
