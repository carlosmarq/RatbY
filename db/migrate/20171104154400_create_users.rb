class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :hostname
      t.string :Caption
      t.string :Description
      t.string :Disabled
      t.string :FullName
      t.string :LocalAccount
      t.string :Lockout
      t.string :Name
      t.string :PasswordChangeable
      t.string :PasswordExpires
      t.string :PasswordRequired
      t.string :SID
      t.timestamps
      t.references :server
    end
  end
end
