class CreateNetworks < ActiveRecord::Migration[5.1]
  def change
    create_table :networks do |t|
      t.string :hostname
      t.string :Caption
      t.string :DHCPEnabled
      t.string :DHCPServer
      t.string :DHCPLeaseObtained
      t.string :DHCPLeaseExpires
      t.string :DNSDomain
      t.string :DNSHostName
      t.string :MACAddress
      t.string :IPAddress
      t.string :IPSubnet
      t.string :DefaultIPGateway
      t.string :DNSServerSearchOrder
      t.timestamps
      t.references :server
    end
  end
end
