clear-host

ipconfig | Select-String -Pattern "IPv4" > ping.txt
    FOREACH ($NUEVA in Get-Content ping.txt) {
        write-host $NUEVA
    }
ipconfig | Select-String -Pattern "Puerta" > ping.txt
    FOREACH ($NUEVA in Get-Content ping.txt) {
        write-host $NUEVA
    }
ipconfig | Select-String -Pattern "255" > ping.txt
    FOREACH ($NUEVA in Get-Content ping.txt) {
        write-host $NUEVA
    }
Get-Content ping.txt

Remove-Item ping.txt
