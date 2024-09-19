$boreport=0

# cmd /c "start /b bore local -p %boreport% --to bore.pub 22 > NUL"
# while (-not $? -or $LASTEXITCODE -ne 0) {
#   $boreport=$(Get-Random -Minimum 2000 -Maximum 65000)
#   echo "boreport=$boreport" | Out-File -FilePath $env:GITHUB_ENV -Encoding utf8 -Append
#   Set-Item -Path Env:\boreport -Value $boreport
#   cmd /c "start /b bore local -p %boreport% --to bore.pub 22 > NUL"
#   # cmd /c "start /b bore local -p %boreport% --to bore.pub 7777 > NUL"
# }
# cmd /c "start /b bore local -p %boreportrdp% --to bore.pub 3389 > NUL"
# while (-not $? -or $LASTEXITCODE -ne 0) {
#   $boreportrdp=$(Get-Random -Minimum 2000 -Maximum 65000)
#   echo "boreportrdp=$boreportrdp" | Out-File -FilePath $env:GITHUB_ENV -Encoding utf8 -Append
#   Set-Item -Path Env:\boreportrdp -Value $boreportrdp
#   cmd /c "start /b bore local -p %boreportrdp% --to bore.pub 3389 > NUL"
# }

$boreport=$(Get-Random -Minimum 2000 -Maximum 65000)
$boreportrdp=$(Get-Random -Minimum 2000 -Maximum 65000)
New-Item -Path Env:\boreport -Value $boreport -Force
New-Item -Path Env:\boreportrdp -Value $boreportrdp -Force
echo "boreportrdp=$boreportrdp" | Out-File -FilePath $env:GITHUB_ENV -Encoding utf8 -Append
echo "boreport=$boreport" | Out-File -FilePath $env:GITHUB_ENV -Encoding utf8 -Append
# $boreError = $true
# while($boreError)
# {
#     echo "boreport loop"
#     Start-Sleep -Seconds 1
#     $boreport=$(Get-Random -Minimum 2000 -Maximum 65000)
#     Set-Item -Path Env:\boreport -Value $boreport -Force
#     $j = Start-Job -ScriptBlock { cmd /c "start /b bore local -p %boreport% --to bore.pub 22 > NUL" }; Start-Sleep -Seconds 1; try { receive-job $j -ErrorAction Stop; $boreError = $false; "bore success"; break } catch { "bore err $_" } 
# }
# $boreportrdp=0
# $boreError = $true
# while($boreError)
# {
#     echo "boreportrdp loop"
#     Start-Sleep -Seconds 1
#     $boreportrdp=$(Get-Random -Minimum 2000 -Maximum 65000)
#     Set-Item -Path Env:\boreportrdp -Value $boreportrdp -Force
#     $j = Start-Job -ScriptBlock { cmd /c "start /b bore local -p %boreportrdp% --to bore.pub 3389 > NUL" }; Start-Sleep -Seconds 1; try { receive-job $j -ErrorAction Stop; $boreError = $false; "bore success"; break } catch { "bore err $_" } 
# }
# $MSG="`n" + "wf: ${{ github.workflow }} - MAIN - ${{ github.event.inputs.pm2file }}" + "`n" + "boressh:  ``boldssh runneradmin@bore.pub -p $boreport``" + "`n" + "rdp: runneradmin@bore.pub:  ``$boreportrdp``";