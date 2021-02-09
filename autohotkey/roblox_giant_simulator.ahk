#IfWinActive Roblox 
WaitClick() {
    dur := 1000 * 60 
    strt := A_Tickcount
    while (A_Tickcount - strt<= dur){
        MouseMove, 175, 810 ; Move mouse to bottom left screen to continue afk clicking
        Click, left
    }
}

^F1:: ; Level up weapons and skins afk
; start with no inventoy open
; always check to make sure that the slot being upgraded half as twice is the winterblade
Loop {
    ClickInventoryButton()

    /*
    SellChests()
    ClickWeaponsTab()
    ClickSecondSlot() 
    ClickUpgradeButton(3) 
    */

    WaitClick()

    SellChests()
    ClickWeaponsTab()
    ClickFirstSlot()
    ClickUpgradeButton(6)

    WaitClick()

    /*
    SellChests()
    ClickSkinsTab() 
    ClickFirstSlot() 
    ClickUpgradeButton(6)
    */

    WaitClick()

    ExitOutOfInventoryButton()
    UpgradeSkills()
}
return

^F2:: ; Move mouse to accept Arena invite
AcceptArenaInvite()
return

^F3:: ; Afk arena invite with 2 roblox windows
Loop {
    WinActivate, ahk_exe RobloxPlayerBeta.exe
    AcceptArenaInvite()
    WinActivate, ahk_exe ApplicationFrameHost.exe ; Opens the Roblox player from Windows
    AcceptArenaInvite()
}
return



#IfWinActive
^p::
Pause, Toggle, 1
Reload
return

AcceptArenaInvite() {
    MouseMove, 875, 270
    Click, left
}

SellChests() {
    Loop 2 {
        ClickChestsTab()
        MouseMove, 1025, 380 ; Common weapons slot
        Click, left
        ClickSellButton()
        
        MouseMove, 1230, 380 ; Common armor slot
        Click, left
        ClickSellButton()
    }
}

ClickSellButton() {
    MouseMove, 1305, 795 ; Sell Button
    Click, left
    Sleep, 500
    MouseMove, 860, 615 ; Confirm button
    Click, left
    Sleep, 500
}

ClickFirstSlot() {
    MouseMove, 925, 320
    Click, left
}

ClickSecondSlot() {
    MouseMove, 1050, 320
    Click, left
}

ClickWeaponsTab() {
    MouseMove, 725, 180
    Click, left
    Sleep, 500
}

ClickSkinsTab() {
    MouseMove, 1025, 180
    Click, left
    Sleep, 500
}

ClickChestsTab() {
    MouseMove, 1325, 180
    Click, left
    Sleep, 500
}

ClickUpgradeButton(n) {
    Loop, %n% {
        MouseMove, 1200, 810
        Click, left
        strt := A_Tickcount
        while (A_Tickcount - strt<= 2250){
            MouseMove, 175, 810 ; Move mouse to bottom left screen to continue afk clicking
            Click, left
        }
    }
}

ClickInventoryButton() {
    MouseMove, 55, 250
    Click, left
    Sleep, 500
}

ExitOutOfInventoryButton() {
    MouseMove, 1561, 222
    Click, left
    Sleep, 500
}

ClickRebirthButton() {
    MouseMove, 55, 434 ; Rebirth icon
    Click, left
    Sleep, 500
}

ClickSkillsTab() {
    MouseMove, 1119, 186
    Click, left
    Sleep, 500
}

ClickMassUpgradeSkillsButton() {
    MouseMove, 845, 825 ; Mass upgrade button
    Click, left
    MouseMove, 1384, 215 ; "X" button
    Click, left
}

UpgradeSkills() { ; Used for during the AFK of weapon/skin upgrading
   ClickRebirthButton() 
   ClickSkillsTab()
   ClickMassUpgradeSkillsButton()
}

RebirthCharacter() {
    ClickRebirthButton()
    MouseMove, 885, 190 ; Rebirth tab
    Click, left
    Sleep, 500
    MouseMove, 1206, 800 ; Rebirth button
    Click, left
    Sleep, 500
    MouseMove, 877, 635 ; Confirm button
    Click, left
    Sleep, 500
    ClickMassUpgradeSkillsButton()
}

ClickEquipMainhand() {
    MouseMove, 675, 773
    Click, left
}

ClickEquipOffhand() {
    MouseMove, 675, 828
    Click, left
}

MoveMouseBottomLeft() {
    MouseMove, 175, 810 ; Move mouse to bottom left screen to continue afk clicking
}

/* 
DEPRECATED REBIRTHING DOESNT SCALE UP SOUL GEMS MULTIPLIER
^F2:: ; Rebirth AFK
; Determine Mouse position for the "Buy" button of buying weapons
; Make sure ur zoomed in and the cursor wont accept the accept arena match invite
MouseGetPos, xP, yP
Loop {
    strt := A_Tickcount
    while (A_Tickcount - strt<= 9000) { ; Click until 100k gold
        MoveMouseBottomLeft()
        Click, left
    }

    MouseMove, %xP%, %yP% ; Buy mainhand weapon
    Click, left
    strt := A_Tickcount
    while (A_Tickcount - strt<= 7500){ ; Click while chest is opening
        MoveMouseBottomLeft()
        Click, left
    }
    ClickInventoryButton()
    ClickSecondSlot() ; Hack to bypass "Weapon already equipped in offhand" bug
    ClickEquipOffhand() ; so that we can equip the bought weapon as a Mainhand
    ClickFirstSlot()
    ClickEquipMainhand()
    ExitOutOfInventoryButton()

    strt := A_Tickcount ; Wait for 100k gold
    while (A_Tickcount - strt<= 500){ 
        MoveMouseBottomLeft()
        Click, left
    }

    MouseMove, %xP%, %yP% ; Buy offhand weapon
    Click, left
    strt := A_Tickcount
    while (A_Tickcount - strt<= 7500){ ; Click while chest is opening
        MoveMouseBottomLeft()
        Click, left
    }
    ClickInventoryButton()
    ClickFirstSlot()
    ClickEquipOffhand()
    ClickSecondSlot() ; Retry if the new weapon was in the second slot
    ClickEquipOffhand()

    strt := A_Tickcount
    while (A_Tickcount - strt<= 500) { ; Click until available rebirth
        MoveMouseBottomLeft()
        Click, left
    }

    RebirthCharacter()
}
return
*/ 

/* 
DEPRECATED NOT NEEDED ANYMORE AS I GAIN GOLD FAST ENOUGH TO GET OP WEAPONS RIGHT FROM THE START
; ^F4:: ; Sell chests, NOT NEEDED ANYMORE
; Loop {
    ; MouseMove, 695, 800 ; Open button, assumes ur already in the Chests tab
    ; Click, left
    ; strt := A_Tickcount
    ; while (A_Tickcount - strt<= 1500){
        ; MouseMove, 175, 810 ; Move mouse to bottom left screen to continue afk clicking
        ; Click, left
    ; }
; }
; return
*/ 
