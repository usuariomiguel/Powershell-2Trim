clear-host 
$ejercicio1=@{
"Manolo"="45";"Maria"="56";"Marta"="60";
"Pepe"="23";"Paco"="34";"Mario"="22";
"Guillermo"="23";"Miguel"="22";"Carlos"="22";
"Anabel"="18";"Lucia"="17";"Hugo"="15";
"Zaira"="78";"Jorge"="89";"Manuel"="12";
}

$p = read-host "Dime el nombre"

while ($opcion -lt 5){

    clear-host

    write-host "            MENU            "
    write-host "* * * * * * * * * * * * * * *"
    write-host "1. edad de esa persona"
    write-host "2. personas mayores que el/ella"
    write-host "3. personas menores que el/ella"
    write-host "4. personas con las misma edad que el/ella"
    write-host "5. Salir"

    $opcion = read-host "elige una opcion"

    switch ($opcion){

    {$opcion -eq 1}
        {
            clear-host
            write-host "la edad de" $p "es" $ejercicio1[$p]
            read-host " "
        }
    {$opcion -eq 2}
        {    
            clear-host
            $i=0   
            write-host $p.toupper()
            write-host `n
                  
            foreach ( $v in $ejercicio1.keys){
                if ($ejercicio1[$v] -gt $ejercicio1[$p]){
                    write-host `t $v "tiene -->" $ejercicio1[$v] 
                $i++} }

            write-host `n
            write-host "TOTAL: "$i
                        
            read-host " "


        }
    {$opcion -eq 3}
        {

            clear-host
            $i=0
            write-host $p.toupper()
            write-host `n

            foreach ( $v in $ejercicio1.keys){

                if ($ejercicio1[$v] -lt $ejercicio1[$p]){
                    write-host `t $v "tiene -->" $ejercicio1[$v] 
                $i++}}

            write-host `n
            write-host "TOTAL: "$i

            read-host " "

                
        }
    {$opcion -eq 4}
        {
            clear-host
            $i=0
            write-host $p.toupper()
            write-host `n

            foreach ( $v in $ejercicio1.keys){

                if ($ejercicio1[$v] -eq $ejercicio1[$p]){
                    write-host `t $v "tiene -->" $ejercicio1[$v] 
                $i++}}

            write-host `n
            write-host "TOTAL: "$i

            read-host " "
            
        }
} }

