#OBJETIVO
VALIDAR CONTRASEÑAS

#RESULTADO
clear-host
"VALIDAR CONTRASEÑAS"
"___________________"
$letras = "abcdefghijklmnopqrstuvwxyz"
$numero = "0123456789"
$letrasmay = $letras.toupper()
$letrasmin = $letras.tolower()
$contraseña = read-host "contraseña"
[int]$longitud = $contraseña.length
$min,$may,$num = 0

if ($longitud -lt 8) {
    write-host "tiene que contener min. 8 caracteres"
    }
    for($i=0;$i -lt $longitud;$i++){
        if ($letrasmin.Contains($contraseña.SUbstring($i,1))){
            $min = 1
        }
}
    for($i=0;$i -lt $longitud;$i++){
        if ($letrasmay.Contains($contraseña.SUbstring($i,1))){
            $may = 1
        }
}
    for($i=0;$i -lt $longitud;$i++){
        if ($numero.Contains($contraseña.SUbstring($i,1))){
            $num = 1
        }
}

if ($min -eq 1 -and $may -eq 1 -and $num -eq 1){
    write-host "contraseña correcta"
    }

if ($min -ne 1){
    write-host "no contiene caracteres minusculos"

    }

if ($may -ne 1){
    write-host "no contiene caracteres mayusculas"

    }
if ($num -ne 1){
    write-host "no contiene caracteres numero"

    } 
