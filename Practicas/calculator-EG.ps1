Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$resp = " "

while ($resp -ne [System.Windows.Forms.DialogResult]::Cancel) {
    $form = New-Object System.Windows.Forms.Form
    $form.Size = New-Object System.Drawing.Size(600, 300)
    $form.StartPosition = "CenterScreen"
    $form.Text = "Calculadora"


    $txtNumero1 = New-Object System.Windows.Forms.TextBox
    $txtNumero1.Location = New-Object System.Drawing.Point(20, 20)
    $txtNumero1.Size = New-Object System.Drawing.Size(100, 40)
    $form.Controls.Add($txtNumero1)

    $ope = New-Object System.Windows.Forms.TextBox
    $ope.Location = New-Object System.Drawing.Point(150, 20)
    $ope.Size = New-Object System.Drawing.Size(40, 40)
    $form.Controls.Add($ope)

    $txtNumero2 = New-Object System.Windows.Forms.TextBox
    $txtNumero2.Location = New-Object System.Drawing.Point(220, 20)
    $txtNumero2.Size = New-Object System.Drawing.Size(100, 40)
    $form.Controls.Add($txtNumero2)

    $outputn = New-Object System.Windows.Forms.Button
    $outputn.Location = New-Object System.Drawing.Point(80, 60)
    $outputn.Size = New-Object System.Drawing.Size(60, 25)
    $outputn.Text = "CANCEL"
    $outputn.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
    $form.Controls.Add($outputn)

    $outputs = New-Object System.Windows.Forms.Button
    $outputs.Location = New-Object System.Drawing.Point(20, 60)
    $outputs.Size = New-Object System.Drawing.Size(60, 25)
    $outputs.Text = "OK"
    $outputs.DialogResult = [System.Windows.Forms.DialogResult]::ok
    $form.Controls.Add($outputs)

    $resp = $form.ShowDialog()
    [int]$n1 = $txtNumero1.Text
    [int]$n2 = $txtNumero2.Text
    if ($resp -eq [System.Windows.Forms.DialogResult]::ok ) {    
    $tt = 0
    $pes2 = New-Object System.Windows.Forms.Form
    $pes2.Size = New-Object System.Drawing.Size(600, 300)
    $pes2.StartPosition = "CenterScreen"
    $pes2.text = "resultado: "
        $total = New-Object System.Windows.Forms.textbox
                if ($ope.Text -eq '+'){
                    [int]$tt =($n1 + $n2)
                    $total.Text = $tt
            }

                elseif ($ope.Text -eq '-'){
                    [int]$tt = ($n1 - $n2)
                    $total.Text = $tt

            }
        
                elseif ($ope.Text -eq '*'){
                    [int]$tt = ($n1 * $n2)
                    $total.Text = $tt
            }
        
                elseif ($ope.Text -eq '/'){
                    [int]$tt = ($n1 / $n2)
                    $total.Text = $tt
            }

        $total.Location = New-Object System.Drawing.Point(20, 20)
        $total.Size = New-Object System.Drawing.Size(100, 40)
        $pes2.Controls.Add($total)
        $pes2.ShowDialog()   
    } 
}
