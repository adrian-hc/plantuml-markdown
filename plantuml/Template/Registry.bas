Attribute VB_Name = "Registry"
'from http://www.slipstick.com/developer/read-and-change-a-registry-key-using-vba/

 
Public Const basekey = "HKEY_CURRENT_USER\Software\PlantUML\"
'reads the value for the registry key i_RegKey
'if the key cannot be found, the return value is ""
Function RegKeyRead(i_RegKey As String, Optional default As String) As String
  On Error Resume Next
  Dim myWS As Object
  If IsMissing(default) Then
     default = ""
  End If
  If Not RegKeyExists(basekey & i_RegKey) Then
    RegKeySave i_RegKey, default, "REG_SZ"
  End If
  On Error Resume Next
  'access Windows scripting
  Set myWS = CreateObject("WScript.Shell")
  'read key from registry
  RegKeyRead = myWS.RegRead(basekey & i_RegKey)
  On Error GoTo 0
End Function
 
'sets the registry key i_RegKey to the
'value i_Value with type i_Type
'if i_Type is omitted, the value will be saved as string
'if i_RegKey wasn't found, a new registry key will be created
 
' change REG_DWORD to the correct key type
Sub RegKeySave(i_RegKey As String, _
               i_Value As String, _
      Optional i_Type As String = "REG_SZ")
    Dim myWS As Object
    On Error Resume Next
 
  'access Windows scripting
  Set myWS = CreateObject("WScript.Shell")
  'write registry key
  myWS.RegWrite basekey & i_RegKey, i_Value, i_Type
  On Error GoTo 0
End Sub


'returns True if the registry key i_RegKey was found
'and False if not
Function RegKeyExists(i_RegKey As String) As Boolean
Dim myWS As Object
 
  On Error GoTo ErrorHandler
  'access Windows scripting
  Set myWS = CreateObject("WScript.Shell")
  'try to read the registry key
  myWS.RegRead i_RegKey
  'key was found
  RegKeyExists = True
  On Error GoTo 0
  Exit Function
   
ErrorHandler:
  'key was not found
  RegKeyExists = False
  On Error GoTo 0
End Function

