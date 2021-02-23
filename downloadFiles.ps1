Function Download-File {
  Param (
    [string]$url,
    [string]$path
  )

  $start_time = Get-Date
  Write-Output "Downloading $($url)"
  $wc = New-Object System.Net.WebClient
  # used to trick sourceforge latest endpoints to get the latest x64 windows binary
  $wc.Headers['User-Agent'] = "Wget x64"
  Try {
    $wc.DownloadFile($url, $path)
  }
  Catch {
    throw $_
  }
  Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"  
}

Try {
  Download-File -url "https://update.code.visualstudio.com/latest/win32-x64-user/stable" -path "$($PSScriptRoot)\scripts\setups\vscode.exe"
  Download-File -url "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v7.8.9/npp.7.8.9.Installer.x64.exe" -path "$($PSScriptRoot)\scripts\setups\notepad++.exe"
  Download-File -url "https://download.sublimetext.com/Sublime%20Text%20Build%203211%20x64%20Setup.exe" -path "$($PSScriptRoot)\scripts\setups\sublime.exe"
  Download-File -url "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-windows-jdk.msi" -path "$($PSScriptRoot)\scripts\setups\corretto.msi"
  Download-File -url "https://ghidra-sre.org/ghidra_9.2_PUBLIC_20201113.zip" -path "$($PSScriptRoot)\scripts\setups\ghidra.zip"
  Download-File -url "https://www.7-zip.org/a/7z1900-x64.msi" -path "$($PSScriptRoot)\scripts\setups\7zip.msi"
  Download-File -url "https://sourceforge.net/projects/dosbox/files/latest/download" -path "$($PSScriptRoot)\scripts\setups\dosbox.exe"
  Download-File -url "https://sourceforge.net/projects/x64dbg/files/latest/download" -path "$($PSScriptRoot)\scripts\setups\x64dbg.zip"
  Download-File -url "https://download.sysinternals.com/files/SysinternalsSuite.zip" -path "$($PSScriptRoot)\scripts\setups\sysinternals.zip"
  Download-File -url "https://github.com/dnSpy/dnSpy/releases/download/v6.1.8/dnSpy-net-win64.zip" -path "$($PSScriptRoot)\scripts\setups\dnSpy.zip"
  Download-File -url "https://www.python.org/ftp/python/3.9.1/python-3.9.1-amd64.exe" -path "$($PSScriptRoot)\scripts\setups\python3.exe"
  Download-File -url "https://www.python.org/ftp/python/2.7.18/python-2.7.18.amd64.msi" -path "$($PSScriptRoot)\scripts\setups\python2.msi"
  Download-File -url "https://github.com/horsicq/DIE-engine/releases/download/3.00/die_win32_portable_3.00.zip" -path "$($PSScriptRoot)\scripts\setups\detectiteasy.zip"
  Download-File -url "https://gitlab.com/x0r19x91/autoit-extractor/-/raw/master/net40/AutoIt%20Extractor/bin/x64/Release/AutoIt%20Extractor.exe?inline=false" -path "$($PSScriptRoot)\scripts\setups\autoitextractor.exe"
  Download-File -url "https://github.com/upx/upx/releases/download/v3.96/upx-3.96-win64.zip" -path "$($PSScriptRoot)\scripts\setups\upx.zip"
  Download-File -url "https://mh-nexus.de/downloads/HxDSetup.zip" -path "$($PSScriptRoot)\scripts\setups\hxd.zip"
  Download-File -url "https://nmap.org/npcap/dist/npcap-1.10.exe" -path "$($PSScriptRoot)\scripts\setups\npcap.exe"
  Download-File -url "https://1.eu.dl.wireshark.org/win64/Wireshark-win64-3.4.3.exe" -path "$($PSScriptRoot)\scripts\setups\wireshark.exe"
  # dep for pebear
  Download-File -url "http://download.microsoft.com/download/3/2/2/3224B87F-CFA0-4E70-BDA3-3DE650EFEBA5/vcredist_x64.exe" -path "$($PSScriptRoot)\scripts\setups\vcredist_x64.exe"
  Download-File -url "https://github.com/hasherezade/pe-bear-releases/releases/download/0.5.2.3/PE-bear_0.5.2.3_x64_win_vs17.zip" -path "$($PSScriptRoot)\scripts\setups\pebear.zip"
  Download-File -url "https://www.winitor.com/tools/pestudio/current/pestudio.zip" -path "$($PSScriptRoot)\scripts\setups\pestudio.zip"
}
Catch {
  $error[0] | Format-List * -force
}
