$ImporingCSVfile = "C:\Pan\import.csv"
$FWOutPut = "C:\Pan\FWAddresses.txt"
$PANOOutPut = "C:\Pan\PANOAddresses.txt"
$XMLFWOutPut = "C:\Pan\XMLFWAddresses.txt"
$XMLPANOOutPut = "C:\Pan\XMLPANOAddresses.txt"



Write-Output " 
Importing Address from '$FWOutPut'


Addresses 'WITHOUT' specified template for CLI will be saved to    '$FWOutPut'

Addresses  'WITH'   specified template for CLI will be saved to   '$PANOOutPut'

Addresses 'WITHOUT' specified template for XML API will be saved to    '$XMLFWOutPut'

Addresses  'WITH'   specified template for XML API will be saved to   '$XMLPANOOutPut'



If any of these address are wrong please terminate now"
pause




$input = Import-Csv $ImporingCSVfile


#File creation for CLI
foreach($line in $input)
{
#FireWall Addresses without Address Description
   if($line.'Device-Group'.Length -eq 0 -and $line.'IP-Netmask'.Length -gt 0 -and $line.'IP-Range'.Length -eq 0 -and $line.'FQDN-Address'.Length -eq 0 -and $line.'Address-Description'.Length -eq 0)
    {
        
        $output1 = "set address '$($line.'Address-Name')' ip-netmask $($line.'IP-Netmask')"
        $output1 | out-file $FWOutPut -Append



    }
    if($line.'Device-Group'.Length -eq 0 -and $line.'IP-Netmask'.Length -eq 0 -and $line.'IP-Range'.Length -gt 0 -and $line.'FQDN-Address'.Length -eq 0 -and $line.'Address-Description'.Length -eq 0)
    {
        
        $output1 = "set address '$($line.'Address-Name')' ip-range $($line.'IP-Range')"

        $output1 | out-file $FWOutPut -Append

    }
   if($line.'Device-Group'.Length -eq 0 -and $line.'IP-Netmask'.Length -eq 0 -and $line.'IP-Range'.Length -eq 0 -and $line.'FQDN-Address'.Length -gt 0 -and $line.'Address-Description'.Length -eq 0)
    {
        
        $output1 = "set address '$($line.'Address-Name')' fqdn $($line.'FQDN-Address')"

        $output1 | out-file $FWOutPut -Append

    }

#FireWall Addresses with Address Description
    if($line.'Device-Group'.Length -eq 0 -and $line.'IP-Netmask'.Length -gt 0 -and $line.'IP-Range'.Length -eq 0 -and $line.'FQDN-Address'.Length -eq 0 -and $line.'Address-Description'.Length -gt 0)
    {
        
        $output1 = "set address '$($line.'Address-Name')' description '$($line.'Address-Description')' ip-netmask $($line.'IP-Netmask')"

        $output1 | out-file $FWOutPut -Append

    } 
    if($line.'Device-Group'.Length -eq 0 -and $line.'IP-Netmask'.Length -eq 0 -and $line.'IP-Range'.Length -eq 0 -and $line.'FQDN-Address'.Length -gt 0 -and $line.'Address-Description'.Length -gt 0)
    {
        
        $output1 = "set address '$($line.'Address-Name')' description '$($line.'Address-Description')' fqdn $($line.'FQDN-Address')"

        $output1 | out-file $FWOutPut -Append

    }
    if($line.'Device-Group'.Length -eq 0 -and $line.'IP-Netmask'.Length -eq 0 -and $line.'IP-Range'.Length -gt 0 -and $line.'FQDN-Address'.Length -eq 0 -and $line.'Address-Description'.Length -gt 0)
    {
        
        $output1 = "set address '$($line.'Address-Name')' description '$($line.'Address-Description')' ip-range $($line.'IP-Range')"

        $output1 | out-file $FWOutPut -Append

    }

#FireWall Address Group with and without Address Description
    if($line.'Device-Group'.Length -eq 0 -and $line.'Address-Group'.Length -gt 0 -and $line.'AG-Description'.Length -eq 0 -and $line.'Address-Name'.Length -gt 0 )
    {
        
        $output1 = "set address-group '$($line.'Address-Group')' static '$($line.'Address-Name')'"

        $output1 | out-file $FWOutPut -Append

    }
    if($line.'Device-Group'.Length -eq 0 -and $line.'Address-Group'.Length -gt 0 -and $line.'AG-Description'.Length -gt 0 -and $line.'Address-Name'.Length -gt 0 )
    {
        
        $output1 = "set address-group '$($line.'Address-Group')' description '$($line.'AG-Description')' static '$($line.'Address-Name')'"

        $output1 | out-file $FWOutPut -Append

    }




   




#Panorama Template Addresses without Address Description
    
   if($line.'Device-Group'.Length -gt 0 -and $line.'IP-Netmask'.Length -gt 0 -and $line.'IP-Range'.Length -eq 0 -and $line.'FQDN-Address'.Length -eq 0 -and $line.'Address-Description'.Length -eq 0)
    {
        
        $output1 = "set device-group $($line.'Device-Group') address '$($line.'Address-Name')' ip-netmask $($line.'IP-Netmask')"

        $output1 | out-file $PANOOutPut -Append

    }
   if($line.'Device-Group'.Length -gt 0 -and $line.'IP-Netmask'.Length -eq 0 -and $line.'IP-Range'.Length -gt 0 -and $line.'FQDN-Address'.Length -eq 0 -and $line.'Address-Description'.Length -eq 0)
    {
        
        $output1 = "set device-group $($line.'Device-Group') address '$($line.'Address-Name')' ip-range $($line.'IP-Range')"

        $output1 | out-file $PANOOutPut -Append

    }
   if($line.'Device-Group'.Length -gt 0 -and $line.'IP-Netmask'.Length -eq 0 -and $line.'IP-Range'.Length -eq 0 -and $line.'FQDN-Address'.Length -gt 0 -and $line.'Address-Description'.Length -eq 0)
    {
        
        $output1 = "set device-group $($line.'Device-Group') address '$($line.'Address-Name')' fqdn $($line.'FQDN-Address')"

        $output1 | out-file $PANOOutPut -Append

    }


#Panorama Template Addresses with Address Description
    if($line.'Device-Group'.Length -gt 0 -and $line.'IP-Netmask'.Length -gt 0 -and $line.'IP-Range'.Length -eq 0 -and $line.'FQDN-Address'.Length -eq 0 -and $line.'Address-Description'.Length -gt 0)
    {
        
        $output1 = "set device-group $($line.'Device-Group') address '$($line.'Address-Name')' description '$($line.'Address-Description')' ip-netmask $($line.'IP-Netmask')"

        $output1 | out-file $PANOOutPut -Append

    }
    if($line.'Device-Group'.Length -gt 0 -and $line.'IP-Netmask'.Length -eq 0 -and $line.'IP-Range'.Length -eq 0 -and $line.'FQDN-Address'.Length -gt 0 -and $line.'Address-Description'.Length -gt 0)
    {
        
        $output1 = "set device-group $($line.'Device-Group') address '$($line.'Address-Name')' description '$($line.'Address-Description')' fqdn $($line.'FQDN-Address')"

        $output1 | out-file $PANOOutPut -Append

    }
    if($line.'Device-Group'.Length -gt 0 -and $line.'IP-Netmask'.Length -eq 0 -and $line.'IP-Range'.Length -gt 0 -and $line.'FQDN-Address'.Length -eq 0 -and $line.'Address-Description'.Length -gt 0)
    {
        
        $output1 = "set device-group $($line.'Device-Group') address '$($line.'Address-Name')' description '$($line.'Address-Description')' ip-range $($line.'IP-Range')"

        $output1 | out-file $PANOOutPut -Append

    }

#Panorama Template Address Group with and without Address Description
    if($line.'Device-Group'.Length -gt 0 -and $line.'Address-Group'.Length -gt 0 -and $line.'AG-Description'.Length -eq 0 -and $line.'Address-Name'.Length -gt 0 )
    {
        
        $output1 = "set device-group $($line.'Device-Group') address-group '$($line.'Address-Group')' static '$($line.'Address-Name')'"

        $output1 | out-file $PANOOutPut -Append

    }
    if($line.'Device-Group'.Length -gt 0 -and $line.'Address-Group'.Length -gt 0 -and $line.'AG-Description'.Length -gt 0 -and $line.'Address-Name'.Length -gt 0 )
    {
        
        $output1 = "set device-group $($line.'Device-Group') address-group '$($line.'Address-Group')' description '$($line.'AG-Description')' static '$($line.'Address-Name')'"

        $output1 | out-file $PANOOutPut -Append

    }

}


