set SETUP_PATH=C:\users\WDAGUtilityAccount\Desktop\scripts\setups
rem we need a writeable location to launch MSIs it seems
copy /B /Y /V %SETUP_PATH%\* %TEMP%\
rem https://github.com/microsoft/vscode/blob/master/build/win32/code.iss
"%TEMP%\vscode.exe" /verysilent /suppressmsgboxes /MERGETASKS="!runcode,desktopicon,quicklaunchicon,addcontextmenufiles,addcontextmenufolders,addtopath"
msiexec /i "%TEMP%\7zip.msi" /qn /norestart
msiexec /i "%TEMP%\corretto.msi" /qn /norestart
"%TEMP%\dosbox.exe" /S
"%TEMP%\notepad++.exe" /S
"%TEMP%\sublime.exe" /VERYSILENT /NORESTART /TASKS="contextentry"
"%TEMP%\vcredist_x64.exe"
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\ghidra.zip" -o"%USERPROFILE%\Desktop\ghidra" 
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\sysinternals.zip" -o"%USERPROFILE%\Desktop\sysinternals"
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\x64dbg.zip" -o"%USERPROFILE%\Desktop\x64dbg"
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\dnSpy.zip" -o"%USERPROFILE%\Desktop\dnSpy"
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\detectiteasy.zip" -o"%USERPROFILE%\Desktop\detectiteasy"
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\upx.zip" -o"%USERPROFILE%\Desktop\upx"
"%TEMP%\vcredist_x64.exe" /passive /norestart
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\pebear.zip" -o"%USERPROFILE%\Desktop\pebear"
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\pestudio.zip" -o"%USERPROFILE%\Desktop\pestudio"
msiexec /i "%TEMP%\python2.msi" /qn /norestart
"%TEMP%\python3.exe" /quiet InstallAllUsers=1 PrependPath=1
copy /B /Y /V "%TEMP%\autoitextractor.exe" "%USERPROFILE%\Desktop\autoitextractor.exe"
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\hxd.zip" -o"%TEMP%"
"%TEMP%\HxDSetup.exe" /VERYSILENT /NORESTART 
rem https://www.wireshark.org/docs/wsug_html_chunked/ChBuildInstallWinInstall.html
rem silent install will not install npcap
"%TEMP%\wireshark.exe" /S /desktopicon=yes
rem npcap does not support silent install ....
"%TEMP%\npcap.exe" /loopback_support=yes
