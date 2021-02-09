#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.


ClickFloorsButton() {
    MouseMove, 1290, 1015 
    Click, left
    Sleep, 2000 ; Allow for floors menu to popup
}
; Screen coordinates
; scrollX := 1405
; firstY := 375
; secondY := 535
; thirdY := 695
; fourthY := 750

scrollX := 1413
firstY := 384
secondY := 544
thirdY := 704
fourthY := 759
savedScrollY := firstY

ResetFloor(num) {
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
^q::
ResetFloor(1)
return

^w::
ResetFloor(2)
return  

^e::
ResetFloor(3)
return

^r::
ResetFloor(4)
return
