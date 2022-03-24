# POWERSHELL ![image](https://iconos8.es/icons/set/powershell)


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

## Operadores ![image](https://github.com/usuariomiguel/Powershell-2Trim/blob/master/img/symbol-operator.png)

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



## Leer Ficheros

Para leer el contenido línea a línea:

```ps1

foreach($registro in Get-Content .\peliculas.txt) {
    $campo = registro.split(":")
    $titulo = $campo[0]
    [int]$anio = $campo[1]
}

# Generar la tabla

$registro=$titulo:$anio

$registro | out-file peliculas.txt -encoding ASCII

```
