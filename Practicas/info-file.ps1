clear-host
write-host "info script"

$c = read-host "nombre carpeta"
$d = read-host "nombre directorio"
new-item -path "c:\$d" -itemtype directory -name "$c"
$s = read-host "nombre script"
$a = read-host "contenido"
new-item -path "c:\$d" -itemtype file -name "$a" -value "$a"

get-childitem -path "c:\$d" -file | 
measure-object -Property length -sum

