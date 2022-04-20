clear-host
[int]$int = read-host ("numero de segundo inferior a 1000000")

if ($int -lt 1000000){

[int]$dias    = $segundos / 86400 
$resto        = $segundos % 86400
[int]$horas   = $resto    / 3600
$resto        = $resto    % 3600
[int]$minutos = $resto    / 60
$seg          = $resto    % 60

}else{
write-host 'numero tiene que ser mayor que 1000000'
}

write-host "El equivalente son" $dias "dias", $horas 'horas' , $minutos 'minutos' ,"y" $int 'segundos' 
