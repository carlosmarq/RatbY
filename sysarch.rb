require 'win32ole'
require 'net/http'
require 'uri'
require 'json'

wmi = WIN32OLE.connect("winmgmts://")


win = wmi.ExecQuery("select * from Win32_OperatingSystem")
hWin32_OperatingSystem = Hash.new
win.each do |cosa|
hWin32_OperatingSystem["hostname"] = cosa.CSName
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

puts "Name: #{hWin32_OperatingSystem}"



uri = URI.parse("http://192.168.1.116:3000/servers/listen")

#header = {'Content-Type': 'application/json'}
#header = {'Accept': 'application/json'}
header = {'Cookie': '123456789', 'Content-Type': 'application/json'}


# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = hWin32_OperatingSystem.to_json


# Send the request
response = http.request(request)

puts "HTTP code response:"
puts response.code

puts "......."
puts request.body
