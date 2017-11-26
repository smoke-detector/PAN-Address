# PAN-Address
Importing Addresses and Address-Groups to Firewall and Panorama

This powershell script will convert all address inside CSV file to CLI command file so that it can be imported to firewall or panorama. 
It will output the address baed on the ip subnet, fqdn, ip-range. (if you specify two in one line, it will not produce any output)
it can take device-group for addresses in Panorama. If the Device-Group box is empty, it will save the command for Firewall. 
API part is in progress
Tag part is in progress
you have to open the ps1 command inside powershell ISE, Select all text and press "F8"
CSV Files needs to be read from "C:\Pan\import.csv"


Make sure you do not have space in any empty boxs in CSV file.
