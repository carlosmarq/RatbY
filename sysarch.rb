require 'win32ole'
require 'net/http'
require 'uri'
require 'json'

wmi = WIN32OLE.connect("winmgmts://")

  def sending(postdatawin, function)


		if function.to_s == "so"
		uri = URI.parse("http://192.168.1.119:3000/servers/listen")
		elsif function.to_s == "users"
		uri = URI.parse("http://192.168.1.119:3000/servers/listenu")
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

puts hWin32_UserAccount
puts " "

sending(hWin32_UserAccount, "users")
end
#######
