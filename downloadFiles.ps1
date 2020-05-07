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
  Download-File -url "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v7.8.6/npp.7.8.6.Installer.x64.exe" -path "$($PSScriptRoot)\scripts\setups\notepad++.exe"
  Download-File -url "https://download.sublimetext.com/Sublime%20Text%20Build%203211%20x64%20Setup.exe" -path "$($PSScriptRoot)\scripts\setups\sublime.exe"
  Download-File -url "https://corretto.aws/downloads/latest/amazon-corretto-11-x64-windows-jdk.msi" -path "$($PSScriptRoot)\scripts\setups\corretto.msi"
  Download-File -url "https://ghidra-sre.org/ghidra_9.1.2_PUBLIC_20200212.zip" -path "$($PSScriptRoot)\scripts\setups\ghidra.zip"
  Download-File -url "https://www.7-zip.org/a/7z1900-x64.msi" -path "$($PSScriptRoot)\scripts\setups\7zip.msi"
  Download-File -url "https://sourceforge.net/projects/dosbox/files/latest/download" -path "$($PSScriptRoot)\scripts\setups\dosbox.exe"
  Download-File -url "https://sourceforge.net/projects/x64dbg/files/latest/download" -path "$($PSScriptRoot)\scripts\setups\x64dbg.zip"
  Download-File -url "https://download.sysinternals.com/files/SysinternalsSuite.zip" -path "$($PSScriptRoot)\scripts\setups\sysinternals.zip"
  Download-File -url "https://github.com/0xd4d/dnSpy/releases/download/v6.1.4/dnSpy-net472.zip" -path "$($PSScriptRoot)\scripts\setups\dnSpy.zip"
}
Catch {
  $error[0] | Format-List * -force
}
