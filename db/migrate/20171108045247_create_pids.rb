class CreatePids < ActiveRecord::Migration[5.1]
  def change
    create_table :pids do |t|
      t.string :hostname
      t.string :Name
      t.string :Description
      t.string :ExecutablePath
      t.string :ProcessId
      t.timestamps
      t.references :server
    end
  end
end
