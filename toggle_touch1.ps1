$touchScreenDevice = Get-PnpDevice | Where-Object { $_.Description -like "*touch screen*" }

if ($touchScreenDevice) {
    if ($touchScreenDevice.Status -eq "OK") {
        Write-Host "Disabling the touch screen..."
        Disable-PnpDevice -InstanceId $touchScreenDevice.InstanceId -Confirm:$false
        Write-Host "Touch screen disabled."
    } else {
        Write-Host "Enabling the touch screen..."
        Enable-PnpDevice -InstanceId $touchScreenDevice.InstanceId -Confirm:$false
        Write-Host "Touch screen enabled."
    }
} else {
    Write-Host "No touch screen device found."
}