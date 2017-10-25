# RatbY
A client-server tool to allow gathering technical information from remote hosts

DESCRIPTION: 
The project consist in a client-server remote software that will allow gathering technical information from remote clients using ruby as a base language and transport over TCP stack.


FEATURES:
A web based GUI password protected in the central server. 
Only an administrator profile will be available in the application. The administrator username and password will be stored in configuration files of the central server once the application is deployed. 
A ruby script for Windows platforms will run in remote clients. A set of predefined system information (network configuration, hostname, running process, local users, network connections, content of specific folders) will be pushed manually from clients to the main server. 
The information will be gathered using the native command line interface and stored in text files locally.
The local files will be send to the central server using a manual push instruction in the ruby code using cURL.
The information retrieved will be stored in a database located in the central server and displayed using a HTTP graphic interface.
Each host will be identified by their hostname, and the technical information gathered will be stored as strings.
Client’s information gathered can be queried and reviewed in the web interface.

SYSTEM REQUIREMENTS AND ENVIRONMENT:
Local administrator privileges, Ruby interpreter, anti-virus exception and no firewall configuration are required in host.
Centralized server running Rails.
Permanent connectivity between clients and servers is a must.
