Dim fso, shell, scriptDir, electronExe

Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")
scriptDir = fso.GetParentFolderName(WScript.ScriptFullName)
shell.CurrentDirectory = scriptDir

electronExe = scriptDir & "\node_modules\electron\dist\electron.exe"

If Not fso.FileExists(electronExe) Then
  MsgBox "Electron not found." & vbCrLf & "Please run start.bat first.", vbCritical, "Clipboard Manager"
  WScript.Quit 1
End If

shell.Run """" & electronExe & """ .", 0, False
