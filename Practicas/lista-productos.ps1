Clear-host 

$dni = read-host “DNI cliente: ”


$existe = ‘n’
foreach ($registro in get-content .\clientes.txt){

	if ($registro.split(“:”)[0] -eq $dni){

	$existe = ‘s’
	$nombre = $registro.split(“:”)[1]
	$apellido1 = $registro.split(“:”)[2]
	$apellido2 = $registro.split(“:”)[3]
	$direccion = $registro.split(“:”)[4]
	}

}

if ($existe -eq ‘n’){

	write-host “Cliente no existe”

}else {

	$carrito = @{}
	$prod = read-host (“producto”)
	$cantidad = read-host (“cantidad”)
		
		foreach ($p in get-content .\productos.txt){

			if ($p.split(“:”)[0] -ieq $prod) {
				$carrito.add($prod,$cantidad)
                $
			}
			
	}

	clear-host
	[float]$total = 0
	write-host “Factura”
	write-host “======”
	write-host (“Nombre: ”+ $apellido1 + ” “ + $apellido2 +”, “ + $nombre)
	write-host (“Direccion:  ”+$direccion)
write-host (“ “)
write-host (“cantidad`t`tPrecio`t`tProducto”)
write-host (“===========================================”)

foreach ($elementos in $carrito.keys){

	foreach ($registro in get-content .\productos.txt){
		if ($registro.split(“:”)[0] -ieq $elementos){
		$total = $total + [float]$registro.split(“:”)[1] * $carrito[$elementos]
		write-host ($carrito[$elementos]+ “`t`t”+ $registro.split(“:”)[1]+ “`t`t”+$elementos)
		}
	}

}

write-host “ ”
write-host “`t`t`tTOTAL: ”+$total
$carrito.clear()

}
