clear-host 

$p = read-host "palabra"

$o=1
foreach ( $texto in get-content Z:\texto.txt){

    $s = $texto.split(" ")

    for ( $i = 0; $i -lt $s.count; $i++){

        if ($p -ieq $s[$i]) {
            write-host "la palabra señor aparece" $p.count "vez, en la posicion" $i "del parrafo" $o
        }
    }
    $o++

}