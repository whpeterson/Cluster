
cd\

#select computers from .txt file source
$servers = Get-content c:\temp\Servers.txt 

$credential = Get-Credential -Credential mgmt\m0063153

ForEach($computer in $servers) {

write-host $computer -ForegroundColor Green

$Results=Invoke-Command -ComputerName $computer -Credential $credential -ArgumentList $computer -Scriptblock { 

param ($computer)

# Create a Shortcut with Windows PowerShell

if (-not (Test-Path D:\Data\Omnipagesupport))   
    {New-Item D:\Data\OmniPageSupport -ItemType Directory}

if (-not (Test-Path C:\Users\s.ocr.module\AppData\Local\Temp\Thomsonreuters)) 
   {New-Item C:\Users\s.ocr.module\AppData\Local\Temp\Thomsonreuters -ItemType Directory}


$TargetFolder = "D:\Data\OmniPageSupport"
$ShortcutFolder = "C:\Users\s.ocr.module\AppData\Local\Temp\Thomsonreuters\Omnipagesupport.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFolder)
$Shortcut.TargetPath = $TargetFolder
$Shortcut.Save()


if (-not (Test-Path C:\Users\s.ocr.module\AppData\Local\Temp\Thomsonreuters\Omnipagesupport.lnk)) {write-host $computer "Shortcut created successfully"} 
Elseif (Test-Path C:\Users\s.ocr.module\AppData\Local\Temp\Thomsonreuters\Omnipagesupport.lnk) {write-host $computer "Shortcut creation failed"} 

}
}
