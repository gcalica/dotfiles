#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

; Macro to move around the arcade. Start from the corner opposite of the teleporter.
#IfWinActive Roblox
CheckCloseButton() {
    xCoord := 960 
    yLevelCloseButtonCoord := 785

    Mousemove, %xCoord%, %yLevelCloseButtonCoord% ; "Close" Button for Leveling up
    Click, left
}

SpamE(duration) {
    strt := A_Tickcount
    while (A_Tickcount - strt<= duration){
        Send, e
        CheckCloseButton()
    }
}

MoveToTeleporter() {
    Send, {w down}
    SpamE(1650)
    Send, {w up}

    Send, {d down}
    SpamE(1650)
    Send, {d up}
}

MoveOuterPerimeter() {
    Loop 1 { ; Outer Loop
        Send, {a down}
        SpamE(3030)
        Send, {a up}

        Send, {s down}
        SpamE(3030)
        Send, {s up}

        Send, {d down}
        SpamE(2965)
        Send, {d up}

        Send, {w down}
        SpamE(2215)
        Send, {w up}
    }
}

MoveInnerPerimter() {
    Loop 1 { ; Inner Loop
        Send, {a down}
        SpamE(2225)
        Send, {a up}

        Send, {s down}
        SpamE(1475)
        Send, {s up}

        Send, {d down}
        SpamE(1500)
        Send, {d up}

        Send, {w down}
        SpamE(725)
        Send, {w up}
    }
}

MoveCentermostTile() {
    Send, {a down}
    SpamE(715)
    Send, {a up}
}

; Screen Coordinates
; scrollX := 1405
; firstY := 375
; secondY := 535
; thirdY := 695
; fourthY := 750

; Window Coordinates
scrollX := 1413
firstY := 384
secondY := 544
thirdY := 704
fourthY := 759
savedScrollY := firstY

ClickFloorsButton() {
    MouseMove, 1290, 1015 
    Click, left
    Sleep, 2000 ; Allow for floors menu to popup
    CheckCloseButton()
}

; 1 - Floors 1, 2, 3
; 2 - Floors 4, 5, 6   
; 3 - Floors 7, 8, 9
ResetFloorMenu(num) {
    global
    if (num = 1) {
        MouseClickDrag, L, %scrollX%, %savedScrollY%, %scrollX%, %firstY%
        savedScrollY := firstY
    }
    else if (num = 2) {
        MouseMove, %scrollX%, %savedScrollY%
        MouseClickDrag, L, 0, 0, 0, 160, , R
        savedScrollY := secondY
    }
    else if (num = 3) {
        MouseMove, %scrollX%, %savedScrollY%
        MouseClickDrag, L, 0, 0, 0, 160, , R
        savedScrollY := thirdY
    }
    else if (num = 4) {
        MouseMove, %scrollX%, %savedScrollY%
        MouseClickDrag, L, 0, 0, 0, 55, , R
        savedScrollY := fourthY
    }
}

ClickTeleportButton(row) {
    xCoord := 1175
    yCoord := 0
    if (row = "top")
        yCoord := 425
    else if (row = "middle")
        yCoord := 605
    else if (row = "bottom") 
        yCoord := 785
    MouseMove, %xCoord%, %yCoord% 
    Click, left
    strt := A_Tickcount
    while (A_Tickcount - strt<= 5000){ ; Allow for arcades to load
        Send, e
        CheckCloseButton()
    }
}

MoveFloor() {
    MoveOuterPerimeter()
    MoveInnerPerimter()
    MoveCentermostTile()
}

^F1::
; Setup for first iteration:
; Click on "Floors" and teleport to Floor 1
; Zoom all the way out
; Line up the bottom of the window bar with the top of the arcade

numFloors := 0
; CoordMode, Mouse, Screen
Loop {
    ; Floor Menu: 1, 2, 3
    MoveFloor() 
    ClickFloorsButton()
    ClickTeleportButton("middle") ; Move to Floor 2
    MoveFloor() 
    ClickFloorsButton()
    ClickTeleportButton("bottom") ; Move to Floor 3
    MoveFloor() 
    ClickFloorsButton()

    ResetFloorMenu(2) ; Floor Menu: 4, 5, 6
    ClickTeleportButton("top") ; Move to Floor 4
    MoveFloor() 
    ClickFloorsButton()
    ClickTeleportButton("middle") ; Move to Floor 5
    MoveFloor() 
    ClickFloorsButton()
    ClickTeleportButton("bottom") ; Move to Floor 6
    MoveFloor() 
    ClickFloorsButton()

    ResetFloorMenu(3) ; Floor Menu: 7, 8, 9
    ClickTeleportButton("top") ; Move to Floor 7
    MoveFloor() 
    ClickFloorsButton()
    ClickTeleportButton("middle") ; Move to Floor 8
    MoveFloor() 
    ClickFloorsButton()
    ClickTeleportButton("bottom") ; Move to Floor 9
    MoveFloor() 
    ClickFloorsButton()

    ResetFloorMenu(4) ; Floor Menu: 8, 9, 10
    ClickTeleportButton("bottom") ; Move to Floor 10
    MoveFloor()
    ClickFloorsButton()

    ResetFloorMenu(1) ; Floor Menu: 1, 2, 3
    ClickTeleportButton("top") ; Move to Floor 1

    numFloors++
}
return

#IfWinActive
^p::
Pause, Toggle, 1
if (GetKeyState("w") = 1) 
    Send, w
else if (GetKeyState("d") = 1) 
    Send, d 
else if (GetKeyState("s") = 1) 
    Send, s
else (GetKeyState("a") = 1) 
    Send, a
MsgBox, %numFloors% iteration
Reload
return
