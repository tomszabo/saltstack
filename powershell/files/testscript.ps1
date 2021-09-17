$ServiceName = 'EventLog'
$ServiceInfo = Get-Service -Name $ServiceName

if ($ServiceInfo.Status -ne 'Running') {
    Start-Service -Name $ServiceName
    $ServiceInfo.Refresh()
    Write-Host $ServiceInfo.Status
}
else {
    Write-Host 'The service is already running'
}
