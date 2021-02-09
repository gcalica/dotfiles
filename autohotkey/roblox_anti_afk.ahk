; Doesn't really work
SendMode Input
^F9::
Loop {
    WinGetActiveTitle, prevWindow
    robloxActive := WinActive("Roblox")
    if (robloxActive = 0) {
        ; MouseGetPos, mX, mY
        WinActivate, Roblox
        Send, {w down}
        Sleep, 100
        Send, {w up}
        ; MouseMove, 500, 500
        ; Click, left
        WinActivate, %prevWindow%
        ; MouseMove, %mX%, %mY%
    } else {
        ; MouseMove, 500, 500
        ; Click, left
        Send, {w down}
        Sleep, 100
        Send, {w up}
    }
    Sleep, 1000 * 60 * 15 
}
return

^p::
Pause, Toggle, 1 
Reload
return
