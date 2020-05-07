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
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\ghidra.zip" -o"%USERPROFILE%\Desktop\ghidra" 
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\sysinternals.zip" -o"%USERPROFILE%\Desktop\sysinternals"
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\x64dbg.zip" -o"%USERPROFILE%\Desktop\x64dbg"
"%PROGRAMFILES%\7-Zip\7z.exe" x "%TEMP%\dnSpy.zip" -o"%USERPROFILE%\Desktop\dnSpy"
