require 'win32ole'
require 'net/http'
require 'uri'
require 'json'

wmi = WIN32OLE.connect("winmgmts://")
processes = wmi.ExecQuery("select * from win32_process")
win = wmi.ExecQuery("select * from Win32_OperatingSystem")

win.each do |cosa|
puts cosa.inspect

puts "BootDevice: #{cosa.BootDevice}"
puts "BuildNumber: #{cosa.BuildNumber}"
puts "BuildType: #{cosa.BuildType}"
puts "Caption: #{cosa.Caption}"
puts "CodeSet: #{cosa.CodeSet}"
puts "CountryCode: #{cosa.CountryCode}"
puts "CreationClassName: #{cosa.CreationClassName}"
puts "CSCreationClassName: #{cosa.CSCreationClassName}"
puts "CSDVersion: #{cosa.CSDVersion}"
puts "CSName: #{cosa.CSName}"
puts "CurrentTimeZone: #{cosa.CurrentTimeZone}"
puts "DataExecutionPrevention_Available: #{cosa.DataExecutionPrevention_Available}"
puts "DataExecutionPrevention_32BitApplications: #{cosa.DataExecutionPrevention_32BitApplications}"
puts "DataExecutionPrevention_Drivers: #{cosa.DataExecutionPrevention_Drivers}"
puts "DataExecutionPrevention_SupportPolicy: #{cosa.DataExecutionPrevention_SupportPolicy}"
puts "Debug: #{cosa.Debug}"
puts "Description: #{cosa.Description}"
puts "Distributed: #{cosa.Distributed}"
puts "EncryptionLevel: #{cosa.EncryptionLevel}"
puts "ForegroundApplicationBoost = 2: #{cosa.ForegroundApplicationBoost = 2}"
puts "FreePhysicalMemory: #{cosa.FreePhysicalMemory}"
puts "FreeSpaceInPagingFiles: #{cosa.FreeSpaceInPagingFiles}"
puts "FreeVirtualMemory: #{cosa.FreeVirtualMemory}"
puts "InstallDate: #{cosa.InstallDate}"
puts "LargeSystemCache: #{cosa.LargeSystemCache}"
puts "LastBootUpTime: #{cosa.LastBootUpTime}"
puts "LocalDateTime: #{cosa.LocalDateTime}"
puts "Locale: #{cosa.Locale}"
puts "Manufacturer: #{cosa.Manufacturer}"
puts "MaxNumberOfProcesses: #{cosa.MaxNumberOfProcesses}"
puts "MaxProcessMemorySize: #{cosa.MaxProcessMemorySize}"
puts "MUILanguages: #{cosa.MUILanguages}"
puts "Name: #{cosa.Name}"
puts "NumberOfLicensedUsers: #{cosa.NumberOfLicensedUsers}"
puts "NumberOfProcesses: #{cosa.NumberOfProcesses}"
puts "NumberOfUsers: #{cosa.NumberOfUsers}"
puts "OperatingSystemSKU: #{cosa.OperatingSystemSKU}"
puts "Organization: #{cosa.Organization}"
puts "OSArchitecture: #{cosa.OSArchitecture}"
puts "OSLanguage: #{cosa.OSLanguage}"
puts "OSProductSuite: #{cosa.OSProductSuite}"
puts "OSType: #{cosa.OSType}"
puts "OtherTypeDescription: #{cosa.OtherTypeDescription}"
puts "PAEEnabled: #{cosa.PAEEnabled}"
puts "PlusProductID: #{cosa.PlusProductID}"
puts "PlusVersionNumber: #{cosa.PlusVersionNumber}"
#puts "PortableOperatingSystem: #{cosa.PortableOperatingSystem}"
puts "Primary: #{cosa.Primary}"
puts "ProductType: #{cosa.ProductType}"
puts "RegisteredUser: #{cosa.RegisteredUser}"
puts "SerialNumber: #{cosa.SerialNumber}"
puts "ServicePackMajorVersion: #{cosa.ServicePackMajorVersion}"
puts "ServicePackMinorVersion: #{cosa.ServicePackMinorVersion}"
puts "SizeStoredInPagingFiles: #{cosa.SizeStoredInPagingFiles}"
puts "Status: #{cosa.Status}"
puts "SuiteMask: #{cosa.SuiteMask}"
puts "SystemDevice: #{cosa.SystemDevice}"
puts "SystemDirectory: #{cosa.SystemDirectory}"
puts "SystemDrive: #{cosa.SystemDrive}"
puts "TotalSwapSpaceSize: #{cosa.TotalSwapSpaceSize}"
puts "TotalVirtualMemorySize: #{cosa.TotalVirtualMemorySize}"
puts "TotalVisibleMemorySize: #{cosa.TotalVisibleMemorySize}"
puts "Version: #{cosa.Version}"
puts "WindowsDirectory: #{cosa.WindowsDirectory}"
#puts "QuantumLength: #{cosa.QuantumLength}"
#puts "QuantumType: #{cosa.QuantumType}"


end

hWin32_OperatingSystem = Hash.new
win.each do |cosa|
hWin32_OperatingSystem["hostname"] = cosa.CSName
hWin32_OperatingSystem["description"] = cosa.Name
end

puts "Name: #{hWin32_OperatingSystem}"



uri = URI.parse("http://192.168.92.138:3000/servers/listen")

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
