clear-host

write-host "horas,segundos,minutos"
[int]$int = read-host ("segundo > 1000000")

if ($int -gt 1000000){
$dias = $int / 86400
$horas = $int / 3600
$minutos = $int / 60
$int
}else{
write-host 'numero tiene que ser mayor que 1000000'
}

write-host 'dias:' $dias 
write-host 'horas:' $horas 
write-host 'minutos:' $minutos 
write-host 'segundos:' $int
