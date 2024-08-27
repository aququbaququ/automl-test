$file = "C:\Users\Fuad Ibrahimzade\Desktop\NinjaTrader.Install.msi"
$log = "install.log" 
$procMain = Start-Process "msiexec" "/i `"$file`" /qn /l*! `"$log`"" -NoNewWindow -PassThru
$procLog = Start-Process "powershell" "Get-Content -Path `"$log`" -Wait" -NoNewWindow -PassThru 
$procMain.WaitForExit() 
$procLog.Kill()



# $TELEGRAM_BOT_TOKEN="7470400956:AAENfI3-3tEpKjdAlIIyci7PHmlKTtiVsds"
# $TELEGRAM_CHAT_ID="1795152902"
# $MSG="``asdasd```n asdasdasd"
# $URL='https://api.telegram.org/bot{0}' -f $TELEGRAM_BOT_TOKEN
# $MessageToSend = New-Object psobject 
# $MessageToSend | Add-Member -MemberType NoteProperty -Name 'chat_id' -Value $TELEGRAM_CHAT_ID
# $MessageToSend | Add-Member -MemberType NoteProperty -Name 'parse_mode' -Value 'MarkDown'
# $MessageToSend | Add-Member -MemberType NoteProperty -Name 'text' -Value $MSG
# Invoke-RestMethod -Method Post -Uri ($URL +'/sendMessage') -Body ($MessageToSend | ConvertTo-Json) -ContentType "application/json"