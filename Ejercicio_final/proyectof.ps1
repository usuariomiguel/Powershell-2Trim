``` ps1
$hash=@{}
$lista=@()

$elemento2 = "Año Fundacion:"
$elemento3 = "Pais fundacion:"
$elemento4 = "Categoria:"
$elemento5 = "Capital Bursatil:"

$tabla2 = @($elemento2,$elemento3,$elemento4,$elemento5)

foreach ( $registro in Get-Content Z:\datos.txt) {

    $campo = $registro.split(":")

        $nombre = $campo[0]
        [int]$añof = $campo[1]
        $pais = $campo[2]
        $servicio = $campo[3]
        $capital = $campo[4]

        $lista=@($añof,$pais,$servicio,$capital)

        $lista+=$añof,$pais,$servicio,$capital

        $hash.add($nombre,$lista)

    }

function añadir ($fañadir) {

        Clear-host

        Write-host "========================="
        write-host "|    Añadir elemento    |"
        Write-host "========================="

        $añadir_nombre = Read-Host "nombre de la empresa"
        [int]$añadir_añof = read-host "año de fundacion"
        $añadir_pais = read-host "pais de la empresa"
        $añadir_servicio = read-host "servicio que ofrece"
        $añadir_acapital = read-host "capital de la empresa"
        
        $valor+=$añadir_añof,$añadir_pais,$añadir_servicio,$añadir_acapital

        $hash.add($añadir_nombre,$valor)

        $v = read-host "ENTER para volver"

    }

function eliminar ($feliminar) {

    while ( $opcion_eliminar -lt 3 ) {

        Clear-host
            
            Write-host "====================================="
            write-host "|       Eliminar elemento           |"
            Write-host "====================================="
            Write-host "====================================="
            write-host "|  1. Eliminar empresa              |"
            write-host "|  2. Eliminar elemento de empresa  |"
            write-host "|  3. Salir                         |"
            Write-host "====================================="

            $opcion_eliminar = read-host "Elige opcion"

            if ( $opcion_eliminar -eq 1 ) {

                    write-host `n
                    write-host "EMPRESAS"
                    write-host `n

                    write-host ( $hash.keys.toupper() | out-string ) `n

                    $eliminar1 = Read-Host "Empresa que quieres borrar"
        
                    $hash.Remove($eliminar1)

                    write-host "Empresa", $eliminar1.toupper(), "eliminada."

                read-host "ENTER para volver"
                

            } elseif ( $opcion_eliminar -eq 2 ) {

                    write-host `n
                    write-host "EMPRESAS"
                    write-host `n
                
                    write-host ( $hash.keys.toupper() | out-string )`n
    
                    $elegir_empre = read-host "Elige una empresa"

                    clear-host

                    Write-Host `n $elegir_empre.toupper()

                    for ( $i = 0; $i -lt $tabla2.count;$i++) {
                
                        write-host `n `t $tabla2[$i].toupper(), $hash[$elegir_empre][$i]

                    }

                    Write-host "____________________________"

                    write-host `n

                    $i=0;
                    while ( $i -lt $tabla2.count ){
                    
                        write-host "[$i]" $tabla2[$i]
                        $i++

                    }

                    write-host `n

			        [int]$elegir_elemento = read-host "Dime un elemento para eliminar"

                    [int]$año_fund = $hash[$elegir_empre][0] 
                    $pais_fund = $hash[$elegir_empre][1] 
                    $category = $hash[$elegir_empre][2] 
                    $cap_burs = $hash[$elegir_empre][3]

                    switch ( $elegir_elemento ){

                        0{ 
                            
                            Write-Host `n $elegir_empre.toupper()

                            for ($i=0;$i -lt $tabla2.count; $i++){

                                if ($hash[$elegir_empre][$i] -ne $año_fund ) {

                                    write-host `n `t $tabla2[$i] $hash[$elegir_empre][$i]
                                    
                                } 
                            }

                            Write-host "____________________________"
                            write-host `n `t $elemento2 $año_fund "desaparece"

                        }

                        1{  

                            Write-Host `n $elegir_empre.toupper()

                            for ($i=0;$i -lt $tabla2.count; $i++){

                                if ($hash[$elegir_empre][$i] -ne $pais_fund ) {

                                    write-host `n `t $tabla2[$i] $hash[$elegir_empre][$i]
                                    
                                } 
                            } 

                            Write-host "____________________________"
                            write-host `n `t $elemento3 $pais_fund "desaparece"

                        }
                        
                        2{  
                        
                            Write-Host `n $elegir_empre.toupper()
                            
                            for ($i=0;$i -lt $tabla2.count; $i++){

                                if ($hash[$elegir_empre][$i] -ne $category ) {

                                    write-host `n `t $tabla2[$i] $hash[$elegir_empre][$i]
                                    
                                } 
                            }  
                                
                            Write-host "____________________________"
                            write-host `n `t $elemento4 $category "desaparece"                                                       
                        
                        }

                        3{ 
                        
                            Write-Host `n $elegir_empre.toupper()

                            for ($i=0;$i -lt $tabla2.count; $i++){

                                if ($hash[$elegir_empre][$i] -ne $cap_burs ) {

                                    write-host `n `t $tabla2[$i] $hash[$elegir_empre][$i]
                                    
                                } 
                            } 

                            Write-host "____________________________"
                            write-host `n `t $elemento5 $cap_burs "desaparece"                                                         
                        
                         }
                        
                    }

                    write-host `n
                    read-host "ENTER para volver"
            }

        }

        $v = read-host "ENTER para volver"

}

function listar ($flistar) {

    clear-host
    
        Write-host "========================="
        write-host "|    Listar elemento    |"
        Write-host "========================="

        foreach ( $empresas in $hash.keys ){
            
            write-host "* * * * * * * * * * "
            write-host `t $empresas.toupper() `t 
            write-host "* * * * * * * * * * " `n

            for ($e=0;$e -lt $tabla2.count;$e++){

                write-host $tabla2[$e], $hash[$empresas][$e] `n

            }

        }

        $v = read-host "ENTER para volver"

    }

function consultar ($fconsultar) {

    while ($opcion_consultar -lt 6) {

        clear-host 

            Write-host "================================="
            write-host "|       Consultar elemento      |"
            Write-host "================================="
            Write-host "| 1. informacion de un elemento |"
            Write-host "| 2. Rango de años              |"
            Write-host "| 3. Buscar por pais            |"
            Write-host "| 4. Buscar por nombre          |"
            Write-host "| 5. Ordenar alfabeticamente    |"
            Write-host "| 6. Salir                      |"
            Write-host "================================="

            $opcion_consultar = read-host "Elige una opcion"

            switch ( $opcion_consultar ) {

                {$_ -eq 1}

                    {

                                    write-host ""
                                    write-host $hash.keys.toupper() `n
    
                                    $elegir_empre = read-host "Elige una empresa"

                                    clear-host

                                    Write-Host `n`t`t $elegir_empre.toupper()

                                    Write-host "____________________________"

                                    for ( $i = 0; $i -lt $tabla2.count;$i++) {
                
                                        write-host `n $tabla2[$i].toupper(), $hash[$elegir_empre][$i]

                                    }

                                        write-host `n

                                    read-host "Volver al menu"

                                }

                {$_ -eq 2 } 
                                
                    {

                                [int]$rango1 = read-host "desde el año"
                                [int]$rango2 = read-host "hasta el año"
                            
                                foreach ( $nempresa in $hash.keys ) {

                                    if ( $rango1 -le $hash[$nempresa][0] -and $rango2 -ge $hash[$nempresa][0] ){

                                        write-host "___________________"
                                        write-host `n `t $nempresa.toupper() `t 
                                        write-host "___________________" `n

                                        write-host $tabla2[0], $hash[$nempresa][0] `n

                                } } 
                                
                                    read-host "Volver al menu"
                                
                                }
                            
                {$_ -eq 3 } 
                                
                    {

                        $busqueda_pais = read-host "dime un pais"
                            
                            foreach ( $nempresa in $hash.keys ) {

                                if ( $busqueda_pais -like $hash[$nempresa][1]){

                                    write-host "___________________"
                                    write-host `n `t $nempresa.toupper() `t 
                                    write-host "___________________" `n

                                    write-host $tabla2[1], $hash[$nempresa][1] `n

                            } } 
                                
                            read-host "Volver al menu"

                    }

                {$_ -eq 4 } 
                                
                    {

                        $n = read-host "dime una empresa"
                            
                            foreach ( $nempresa in $hash.keys ) {

                                if ( $nempresa -like $n){
                                        
                                    write-host "___________________"
                                    write-host `n `t $nempresa.toupper() `t 
                                    write-host "___________________" `n

                                for ($e=0;$e -lt $tabla2.count;$e++){

                                    write-host $tabla2[$e], $hash[$nempresa][$e] `n

                                }

                            } } 
                                
                        read-host "Volver al menu"

                    }

                {$_ -eq 5 } 
                            
                    { 
                                
                        write-host "" 
                        $hash.keys.toupper() | sort-object 
                        read-host `n "Volver al menu"
                                
                    }

            }

        } 
}

function modificar ($fmodificar) {

    clear-host
    
        Write-host "================================="
        write-host "|       Modificar elemento      |"
        Write-host "================================="
        $nombre = read-host "Nombre de la empresa"
        foreach ( $claves in $hash.keys ) {

            if ( $claves -like $nombre ) {

                write-host `t $claves

                $año_fund = read-host "Año Fundacion:" $hash[$claves][0] 
                if ($año_fund -ne ""){
                    $hash[$claves][0] = $año_fund
                }

                $pais_fund = read-host "Pais fundacion" $hash[$claves][1] 
                if ($pais_fund -ne ""){                
                    $hash[$claves][1] = $pais_fund
                }

                $categoria = read-host "Categoria" $hash[$claves][2] 
                if ($categoria -ne ""){
                    $hash[$claves][2] = $categoria
                }

                $cap_burs = read-host "Capital Bursatil" $hash[$claves][3] 
                if ($cap_burs-ne ""){
                    $hash[$claves][3] = $cap_burs
                }
            }

        }

        $v = read-host "ENTER para volver"

}

function salir ($fsalir) {

        clear-host
        
            Write-host "============================================"
            write-host "|               Menu Salir                 |"
            Write-host "============================================"
            Write-host "| 1. Desea salir guardando los cambios     |"
            Write-host "| 2. Desea salir sin guardar los cambios   |"
            Write-host "============================================"

            $opcion_salir = Read-host "Elegir una opcion"

            if ($opcion_salir -eq 1 ){

                Remove-item Z:\prueba.txt

                foreach ( $para_guardar in $hash.keys ) {
                    
                    $info_guardar = $para_guardar + ":" + $hash[$para_guardar][0] + ":" + $hash[$para_guardar][1] + ":" + $hash[$para_guardar][2] + ":" + $hash[$para_guardar][3]

                    $info_guardar | out-file Z:\datos.txt -Append -encoding utf8

                }

            } 

            write-host `n "Adios"

} 

$o = 0;
while ($o -lt 6 ) {

        clear-host
    
        write-host "   *  *  *  *  *  *  *  *  *   "  
        write-host "   *  _  _  __ _  _ _  _   *   "  
        write-host "   *  |\/| |__ |\ | |  |   *   "
        write-host "   *  |  | |__ | \| |__|   *   "
        write-host "   *                       *   "
        write-host "   *  *  *  *  *  *  *  *  *   "  
        Write-host "                               "
        Write-host " 1. Añadir empresa             "
        Write-host " 2. Eliminar empresa           "
        Write-host " 3. Listar empresas            "
        Write-host " 4. Consultar empresas         "
        Write-host " 5. Modificar empresas         "
        Write-host " 6. Salir                      "
        Write-host "                               "

        [int]$o = Read-Host "Elegir opcion: "

        switch ($o) {

            1{añadir $fañadir}
            2{eliminar $feliminar}
            3{listar $flistar}
            4{consultar $fconsultar}
            5{modificar $fmodificar}
            6{salir $fsalir}
            }
}
```