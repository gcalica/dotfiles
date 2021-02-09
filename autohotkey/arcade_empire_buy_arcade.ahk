Buy() {
    Send, e
    Sleep, 1000
    MouseMove, 970, 540
    Click, left
    MouseMove, 970, 670
    Click, left
    Sleep, 1000
    MouseMove, 1680, 1020
    Click, left
}

Upgrade() {
    MouseMove, 600, 465 ; Upper Left Inventory
    Click, left
    MouseMove, 980, 670 ; Upgrade Button
    Click, left
    Sleep, 1500
    MouseMove, 970, 690 ; Combine All Button
    Click, left
    Sleep, 1500
}

#IfWinActive Roblox
^F1::
Loop {
    Buy()
    Sleep, 2000
    Upgrade()
    Upgrade()
    Upgrade()
    Buy()
    Sleep, 2000
    Upgrade()
    Upgrade()
}
return

#IfWinActive
^p::
Pause, Toggle, 1
Reload
return
