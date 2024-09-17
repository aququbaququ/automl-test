New-Item -Path Env:\boreport -Value 1111 -Force

# $job = Start-Job -ScriptBlock { cmd /c "start /b bore local -p %boreport% --to bore.pub 22 > NUL" }
# Wait-Job $job
# echo $job.State
# Start-Sleep -Seconds 1
# Receive-Job -Job $job

$boreport=0
$boreError = $true
while($boreError)
{
    Start-Sleep -Seconds 1
    $boreport=$(Get-Random -Minimum 2000 -Maximum 65000)
    Set-Item -Path Env:\boreport -Value $boreport -Force
    $j = Start-Job -ScriptBlock { cmd /c "start /b bore local -p %boreport% --to bore.pub 22 > NUL" } ; Start-Sleep -Seconds 1; try { receive-job $j -ErrorAction Stop; $boreError = $false; "bore success" } catch { "bore err $_" } 
}