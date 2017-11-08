require 'win32ole'
require 'net/http'
require 'uri'
require 'json'

wmi = WIN32OLE.connect("winmgmts://")

  def sending(postdatawin, function)


		if function.to_s == "so"
		uri = URI.parse("http://192.168.92.139:3000/servers/listen")
		elsif function.to_s == "users"
		uri = URI.parse("http://192.168.92.139:3000/servers/listenu")
		elsif function.to_s == "process"
		uri = URI.parse("http://192.168.92.139:3000/servers/listenp")
		elsif function.to_s == "network"
		uri = URI.parse("http://192.168.92.139:3000/servers/listenn")
		end
	header = {'Cookie': '123456789', 'Content-Type': 'application/json'}

	# Create the HTTP objects
	http = Net::HTTP.new(uri.host, uri.port)
	request = Net::HTTP::Post.new(uri.request_uri, header)
	request.body = postdatawin.to_json

	# Send the request
	response = http.request(request)
	puts "HTTP code response:"
	puts response.code
	puts "......."
	puts request.body
  end

##### Send SO stuff
win = wmi.ExecQuery("select * from Win32_OperatingSystem")
hWin32_OperatingSystem = Hash.new

win.each do |cosa|
hWin32_OperatingSystem["hostname"] = cosa.CSName
@Hostname = cosa.CSName
hWin32_OperatingSystem["Caption"] = cosa.Caption
hWin32_OperatingSystem["CSDVersion"] = cosa.CSDVersion
hWin32_OperatingSystem["BuildNumber"] = cosa.BuildNumber
hWin32_OperatingSystem["OSArchitecture"] = cosa.OSArchitecture
hWin32_OperatingSystem["WindowsDirectory"] = cosa.WindowsDirectory
hWin32_OperatingSystem["OSLanguage"] = cosa.OSLanguage
hWin32_OperatingSystem["CurrentTimeZone"] = cosa.CurrentTimeZone
hWin32_OperatingSystem["CountryCode"] = cosa.CountryCode
hWin32_OperatingSystem["InstallDate"] = cosa.InstallDate
hWin32_OperatingSystem["LastBootUpTime"] = cosa.LastBootUpTime
hWin32_OperatingSystem["LocalDateTime"] = cosa.LocalDateTime
end

sending(hWin32_OperatingSystem, "so")

##### Send users
winusers = wmi.ExecQuery("select * from Win32_UserAccount")

winusers.each do |cosa|
hWin32_UserAccount = Hash.new
hWin32_UserAccount["hostname"] = @Hostname
hWin32_UserAccount["Caption"] = cosa.Caption
hWin32_UserAccount["Description"] = cosa.Description
hWin32_UserAccount["Disabled"] = cosa.Disabled
hWin32_UserAccount["FullName"] = cosa.FullName
hWin32_UserAccount["LocalAccount"] = cosa.LocalAccount
hWin32_UserAccount["Lockout"] = cosa.Lockout
hWin32_UserAccount["Name"] = cosa.Name
hWin32_UserAccount["PasswordChangeable"] = cosa.PasswordChangeable
hWin32_UserAccount["PasswordExpires"] = cosa.PasswordExpires
hWin32_UserAccount["PasswordRequired"] = cosa.PasswordRequired
hWin32_UserAccount["SID"] = cosa.SID

sending(hWin32_UserAccount, "users")
end
####### Send process

#winprocess = wmi.ExecQuery("Select * From Win32_Process Where Name='cmd.exe'")
winprocess = wmi.ExecQuery("Select * From Win32_Process")

winprocess.each do |cosa|
hWin32_Process = Hash.new
hWin32_Process["hostname"] = @Hostname
hWin32_Process["Name"] = cosa.Name
hWin32_Process["Description"] = cosa.Description
hWin32_Process["ExecutablePath"] = cosa.ExecutablePath
hWin32_Process["ProcessId"] = cosa.ProcessId
sending(hWin32_Process, "process")
end

####### Send network configuration

winnetwork = wmi.ExecQuery("Select * From Win32_NetworkAdapterConfiguration")

winnetwork.each do |cosa|
hWin32_Network = Hash.new
hWin32_Network["hostname"] = @Hostname
hWin32_Network["Caption"] = cosa.Caption
hWin32_Network["DHCPEnabled"] = cosa.DHCPEnabled
hWin32_Network["DHCPServer"] = cosa.DHCPServer
hWin32_Network["DHCPLeaseObtained"] = cosa.DHCPLeaseObtained
hWin32_Network["DHCPLeaseExpires"] = cosa.DHCPLeaseExpires
hWin32_Network["DNSDomain"] = cosa.DNSDomain
hWin32_Network["DNSHostName"] = cosa.DNSHostName
hWin32_Network["MACAddress"] = cosa.MACAddress
hWin32_Network["IPAddress"] = cosa.IPAddress
hWin32_Network["IPSubnet"] = cosa.IPSubnet
hWin32_Network["DefaultIPGateway"] = cosa.DefaultIPGateway
hWin32_Network["DNSServerSearchOrder"] = cosa.DNSServerSearchOrder
puts "To be send "
puts hWin32_Network
puts " "
sending(hWin32_Network, "network")
end
