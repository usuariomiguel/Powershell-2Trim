CLEAR-HOST

function crear ($fcrear) {
    $cont = read-host "contenido del fichero"
    $nom = read-host "nombre del fichero"
    new-item -Path './' -itemtype file -Value $cont
    }
function visualizar ($fvis) {
    Get-ChildItem -Path ./$nombre_fichero
    }
function borrar ($fdel) {
    Remove-Item -Path ./$nom
    }
 
 $num = 0
 while($num -lt 4){
    
    write-host "MENU"
    write-host "____"
    write-host "1. Crear fichero"
    write-host "2. Ver fichero"
    write-host "3. Borrar fichero"
    write-host "4. Salir"
    [int]$num = read-host "Eligue una opcion"

    $nombre_fichero = read-host "nombre del fichero"

    switch ($num) { 
    1{crear $nombre_fichero}
    2{visualizar $nombre_fichero}
    3{borrar $nombre_fichero}
    }
}
