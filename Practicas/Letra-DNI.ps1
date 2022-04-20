$letra = @("T","R","W","A","G","M","Y","E","F","P","D","X","B","N","J","Z","S","Q","V","H","L","C","K","E")

[string]$dni = Read-Host("Introduce DNI")

$dni_0 = $dni.PadLeft(8,"0")
$dni_sl = $dni_0.Substring(0,8)

$indice = [int]$dni_sl % 23
$letradni = $letra[$indice+1]

Write-Host $dni_sl $letradni
