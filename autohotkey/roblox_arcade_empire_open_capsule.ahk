#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Macro to open the capsules and click on the "Close" button afterwards. Also clicks the "Close" button popup when the player levels up.
#IfWinActive Roblox
^F1::
xCoord := 960 
yLevelCloseButtonCoord := 785
Loop 
{
    Mousemove, %xCoord%, %yLevelCloseButtonCoord% ; "Close" Button for Leveling up
    Click, left
    Send, e
    ; Sleep, 4500
    Mousemove, %xCoord%, 960 ; "Close" Button for Opening Capsules
    Click, left
    ; Sleep, 1000
    Sleep, 100
}
return

#IfWinActive
^p::
Pause, Toggle, 1
Reload
return
