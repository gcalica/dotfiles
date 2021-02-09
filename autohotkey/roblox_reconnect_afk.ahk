SendMode Input
CoordMode, window
^Numpad1::
Loop {
    WinGetActiveTitle, prevWindow
    robloxActive := WinActive("Roblox")
    if (robloxActive = 0) {
        MouseGetPos, mX, mY
        WinActivate, Roblox
        MouseMove, 1060, 595
        Click, left
        WinActivate, %prevWindow%
        MouseMove, %mX%, %mY%
    } else {
        MouseMove, 1060, 595
        Click, left
    }
    Sleep, 1000 * 60 * 5 
}
return

^p::
Pause, Toggle, 1 
Reload
return
