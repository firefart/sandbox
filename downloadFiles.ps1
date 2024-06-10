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
  Download-File -url "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.8/npp.8.6.8.Installer.x64.exe" -path "$($PSScriptRoot)\scripts\setups\notepad++.exe"
  Download-File -url "https://download.sublimetext.com/sublime_text_build_4169_x64_setup.exe" -path "$($PSScriptRoot)\scripts\setups\sublime.exe"
  Download-File -url "https://corretto.aws/downloads/latest/amazon-corretto-21-x64-windows-jdk.msi" -path "$($PSScriptRoot)\scripts\setups\corretto.msi"
  Download-File -url "https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.1_build/ghidra_11.1_PUBLIC_20240607.zip" -path "$($PSScriptRoot)\scripts\setups\ghidra.zip"
  Download-File -url "https://www.7-zip.org/a/7z2406-x64.exe" -path "$($PSScriptRoot)\scripts\setups\7zip.msi"
  Download-File -url "https://sourceforge.net/projects/dosbox/files/latest/download" -path "$($PSScriptRoot)\scripts\setups\dosbox.exe"
  Download-File -url "https://sourceforge.net/projects/x64dbg/files/latest/download" -path "$($PSScriptRoot)\scripts\setups\x64dbg.zip"
  Download-File -url "https://download.sysinternals.com/files/SysinternalsSuite.zip" -path "$($PSScriptRoot)\scripts\setups\sysinternals.zip"
  Download-File -url "https://github.com/dnSpyEx/dnSpy/releases/latest/download/dnSpy-net-win64.zip" -path "$($PSScriptRoot)\scripts\setups\dnSpy.zip"
  Download-File -url "https://www.python.org/ftp/python/3.12.4/python-3.12.4-amd64.exe" -path "$($PSScriptRoot)\scripts\setups\python3.exe"
  Download-File -url "https://www.python.org/ftp/python/2.7.18/python-2.7.18.amd64.msi" -path "$($PSScriptRoot)\scripts\setups\python2.msi"
  Download-File -url "https://github.com/horsicq/DIE-engine/releases/download/3.09/die_win64_portable_3.09_x64.zip" -path "$($PSScriptRoot)\scripts\setups\detectiteasy.zip"
  Download-File -url "https://github.com/upx/upx/releases/download/v4.2.4/upx-4.2.4-win64.zip" -path "$($PSScriptRoot)\scripts\setups\upx.zip"
  Download-File -url "https://mh-nexus.de/downloads/HxDSetup.zip" -path "$($PSScriptRoot)\scripts\setups\hxd.zip"
  Download-File -url "https://npcap.com/dist/npcap-1.79.exe" -path "$($PSScriptRoot)\scripts\setups\npcap.exe"
  Download-File -url "https://2.na.dl.wireshark.org/win64/Wireshark-4.2.5-x64.exe" -path "$($PSScriptRoot)\scripts\setups\wireshark.exe"
  # dep for pebear
  Download-File -url "https://aka.ms/vs/17/release/vc_redist.x64.exe" -path "$($PSScriptRoot)\scripts\setups\vcredist_x64.exe"
  Download-File -url "https://github.com/hasherezade/pe-bear/releases/download/v0.6.7.3/PE-bear_0.6.7.3_x64_win_vs19.zip" -path "$($PSScriptRoot)\scripts\setups\pebear.zip"
  Download-File -url "https://www.winitor.com/tools/pestudio/current/pestudio.zip" -path "$($PSScriptRoot)\scripts\setups\pestudio.zip"
  Download-File -url "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml" -path "$($PSScriptRoot)\scripts\setups\sysmonconfig-export.xml"
}
Catch {
  $error[0] | Format-List * -force
}
