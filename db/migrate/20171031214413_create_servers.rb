class CreateServers < ActiveRecord::Migration[5.1]
  def change
    create_table :servers do |t|
      t.string :hostname
      t.string :Caption
      t.string :CSDVersion
      t.string :BuildNumber
      t.string :OSArchitecture
      t.string :WindowsDirectory
      t.string :OSLanguage
      t.string :CurrentTimeZone
      t.string :CountryCode
      t.string :InstallDate
      t.string :LastBootUpTime
      t.string :LocalDateTime
      t.timestamps
    end
  end
end
