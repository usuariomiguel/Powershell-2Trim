# POWERSHELL ![image](https://github.com/usuariomiguel/Powershell-2Trim/blob/master/img/icons8-powershell-48%20(1).png)


## Al iniciar PowershelISE
> Ejecutar *Get-ExecutionPolicy* 

## Variables 

Espacio reservado de la memoria principal a la que ponemos un nombre y cuyo contenido puede variar durante la ejecución del programa.

El nombre debe cumplir unas normas:

- Empezar por $
- A continuación letras, números o símbolos
- Ir entre {}, si el nombre contiene espacios en blanco

### Variables – Tipos de datos - Conversores

![image](https://github.com/usuariomiguel/Powershell-2Trim/blob/master/img/Variables_1.png)

### Variables predefinidas

![image](https://github.com/usuariomiguel/Powershell-2Trim/blob/master/img/variables_perdefinidas.png)

Variable.GetType()
- Muestra el tipo de dato
Variable.Count()
- Muestra conteo de posiciones args

### Caracteres de escape

![image](https://github.com/usuariomiguel/Powershell-2Trim/blob/master/img/caracteres_escape.png)

## Operadores

### Aritmeticos

`+ - * / %`

### Notacion Compacta
`+= --> $a = $a + $b`
### Incremento
`$a++ = $a += 1`
### Concatena
`+ --> $a + $b`

`* --> $a * 3`

### Operadores de comparacion

![image](https://github.com/usuariomiguel/Powershell-2Trim/blob/master/img/operadores_de_comparador.png)

### Logicos

![image](https://github.com/usuariomiguel/Powershell-2Trim/blob/master/img/operadores_logicos.png)

## ESTRUCTURAS DE CONTROL

### CONDICIONALES

#### **IF** 

***Permite crear condiciones***

```ps1

# Sintaxis
if (condición) {Sentencias_si_es_verdad_1}
	elseif (condición) {Sentencias_si_es_verdad_2}
	else {Sentencias_si_es_falso}

# Real

clear-host
[int]$edad = read-host "dime tu edad?"
$tatus = read-host "tienes tattos?"
if ($edad -lt 18) {
    write-host "no entras"
} elseif {$tatto -ieq "s"} {
    write-host "no entras"
} else {
    write-host "puedes entras"
}
```

#### **SWITCH**

***Alternativa a la orden if, cuando hay una gran cantidad de condiciones***

```ps1

#Sintaxis

Switch (valor_de_prueba) {
		Patrón 1 {Sentencias_1}
		Patrón 2 {Sentencias_2}
		Patrón n {Sentencias_n}
		Default  {Sentencias_por_defecto}
	}

# Real
# $_ representa el elemento actual de la canalización.
Switch ($edad) {
		{$_ -lt 2} {$mensaje="bebe"
                            break}
		{$_ -lt 5} {$mensaje="peque"
                            break}
		{$_ -lt 12} {$mensaje="chavalitos"
                            break}
		{$_ -lt 18} {$mensaje="adolescentes"
                            break}
		{$_ -lt 30} {$mensaje="jovenes"
                            break}
		{$_ -lt 70} {$mensaje="adultos"
                            break}
		default {$mensaje='mayores'}
}
write-host "Eres un", $mensaje

```

### REPETITIVAS

#### **DO WHILE**

***Permite repetir un bloque de código mientras una determinada condición siga siendo verdadera***

```ps1

# Sintax

Do {Sentencias} 
While (condición)

# Real

$i = 0

do { 
    $i+=1
    write-host $i 
    }
while ( $i -le 10 )

```

#### **WHILE**

***Permite repetir un bloque de código mientras la condición que lo controla siga devolviendo el valor $true***

```ps1

# Sintax

While (condición) 
{Sentencias}

# Real

$i = 0
while ($i -le 10){
    write-host $i
    $i+=1
}

## Array

[int]$tabla = @(1,2,3,4)

$indice = 0 

while ($indice -lt $tabla.Count){
    write-host $tabla[$indice]
    $indice++
}

```

#### **DO UNTIL**

***Se van a reetir las sentencias hasta que la condicion sea verdadera***

```ps1
Do {Sentencias} 
until (condición)
```

#### **FOR**

***Repite la ejecución de las sentencias un número determinado de veces***

```ps1

# Sintax

for (valor_inicial; condición; incremento){
    Sentencias
    }

# Real 

for ($i = 0; $i -le 10; $i++){
    write-host $i
    }

## ARRAY 

for ($i = 0; $i -le 10; $i++){
    write-host $i
    }

```

#### **FOREACH**

***Nos permite recorrer listas de elementos, como las tablas***

```ps1

# Sintax

foreach (elemento in colección) {
    Sentencias
    }

# Real

[int]$tabla = @(1,2,3,4)

foreach ( $elemento in $tabla ) {
    write-host $elemento
}

```

> Ejercicios

- Introducir por linea de comandos una palabra y mostrar dicha palabra y la suma de los codigos ascii de cada una de sus letras

## Objeto string

### Atributos

*Cada variable PowerShell es un objeto, y como tal posee Atributos (propiedades) y Métodos (funciones)*

- CHAR(INT32) -> *Devuelve el carácter que ocupa la posición indicada en la cadena. Empieza en 0.*
- Length -> *Devuelve el número de caracteres de una cadena.*

### Metodos

![image](https://github.com/usuariomiguel/Powershell-2Trim/blob/master/img/objeto_string.png)

## Arrays o tablas

+ Lista de valores, de cualquier tipo, que podemos identificar de forma individual por la posición que ocupan dentro de la lista o índice
+ Solo están disponibles mientras se ejecuta el programa.
+ Poseen atributos (Length) y métodos

+ Método explícito:

```ps1

$tabla = @(valor1, valor2, valor3)
$numeros = @(1,2,3,4)

```

+ Método implícito:

```ps1

$tabla = valor1, valor2, valor3
[char[]]$letras = ‘a’,’b’,’c’

```

### Añadir elementos

**$array+=$nuevo_elemento**

```ps1

$nuevo = read-host "Dime un nuevo elemento:"
$tabla+=$nuevo

```

### Eliminar elementos

```ps1

[int]$tabla = @(1,2,3,4)
$nueva=@()

$eliminar = read-host "DIme un elemento para eliminar"
for ($i=0; $i -lt $tabla.count; $i++){
    if ($tabla[$i] -ne $elimimar) {
        $nueva+=$tabla[$i]
    }
}

write-host "Tabla original", $tabla
write-host "Tabla nueva", $nueva
$tabla=$nueva
write-host "Tabla original actualizada", $tabla #pasa valores de $nueva a $tabla

```

## Tablas Hash o diccionarios

```ps1

# Sintax

$frutas=@{"clave"=valor;"clave"=valor;"clave"=valor;...}

# Real

$frutas=@{"naranja"="naranja";"fresa"="roja";"limon"="amarillo";"manzana"="roja";"melon"="verde"}

<#
$agenda=@{}
-- tabla vacia -- 


__AÑADIR ELEMENTOS__

- Tres formas para añadir elementos: 

$frutas["melocoton"]="amarillo"
$frutas.ciruela="verde"
$frutas.add("aguacate","verde")


__MOSTRAR ELEMENTOS__

-No podemos usar directamente Write-Host

Write-Host ($países | Out-String)
-Canaliza el contenido con Out-String (muestra claves y valores)


$frutas.keys
-.Keys muestra claves de tablas hash

$frutas.value
-.values muestra valores de tablas hash

$frutas.count
-.count muestra numero de elementos de tablas hash

foreach ( $clave in $frutas.keys ) {
    write-host "el color de el/la", $clave, "es:", $futas[$clave]
}

__ELIMINAR ELEMENTOS__

$tabla.Remove["clave"]
El parámetro será la clave del elemento

$tabla.Clear()
Borra toda la tabla

$frutas.Remove("naranja")
#> 

__Leer Ficheros__

Para leer el contenido línea a línea:

foreach($registro in Get-Content .\peliculas.txt) {
    $campo = registro.split(":")
    $titulo = $campo[0]
    [int]$anio = $campo[1]
}

# Generar la tabla

$registro=$titulo:$anio

$registro | out-file peliculas.txt -encoding ASCII

```

> Ejercicio: 

1. Crear un fichero secuencial con los datos que queramos cargar en la tabla hash

2.  Crear una tabla hash a partir de los datos del fichero, cuyos elementos sean arrays. 

	Por ejemplo:

	*$peliculas=@{"titulo"=@(año,"estudio","protagonista","protagonistaM","director",nºoscar,valoracion);
	}*

**Crear las siguientes opciones:**

1. Añadir elementos a la tabla hash
2. Eliminar elementos a la tabla hash
3. Listar elementos a la tabla hash
4. Consultar
    - Buscar informacion de un elemento
    - Buscar por rango
        - Por años
        - Por valoracio
        - Por oscar
5. Modificar elemento
6. Salir
    - Enviar la informacion de la tabla hash a un fichero

## Ficheros - Crear archivos

*En consola:*

$registro = “Pepe”+"#"+ “Perez”+"#"+ “628455621”+ "#"+ “pperez@Gmail.com”

*En Bloc de Notas:*

JUMANJI:2003:MGM:Robin W:XX:YY:0:7

``` ps1
$hash=@{}
$lista=@()

$elemento2 = "Año Fundacion:"
$elemento3 = "Pais fundacion:"
$elemento4 = "Categoria:"
$elemento5 = "Capital Bursatil:"

$tabla2 = @($elemento2,$elemento3,$elemento4,$elemento5)

foreach ( $registro in Get-Content Z:\datos_tablaS.txt) {

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

                    $info_guardar | out-file Z:\prueba.txt -Append -encoding utf8

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
