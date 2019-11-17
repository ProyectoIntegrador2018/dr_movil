class AddStatusColumnToLogTable < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :status, :string
  end
end
