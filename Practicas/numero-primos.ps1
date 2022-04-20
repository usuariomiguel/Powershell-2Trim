 clear-host 
'numero primos'
'_____________'

for ($n = 1; $n -le 100; $n++){

    $resto = $n % 2
    $resto2 = $n % 3

    if ($resto -eq 0){
        }
    elseif ($resto2 -eq 0){
        }
    elseif ($resto -ne 0){
        write-host $n
        }
    elseif ($resto2 -ne 0){
        write-host $n
        }
} 
