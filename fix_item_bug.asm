



;start of patch for chest open bug
;============================================================================================================
.bank $0E .slot 1


.org $4545 - $4000 ;jump to patch code cave
.SECTION "patchJump" OVERWRITE
		
		jp patchedSwitchBytes
		
.ENDS


.org $7c70 - $4000 ;code cave
.SECTION "patchJumpTarget" OVERWRITE
	
	patchedSwitchBytes:
		cp   $18
		jr   z,isSwitch
		cp   $19
		jr   z,isSwitch
		cp   $5E
		jr   z,isSwitch
		cp   $5F
		jr   nz,notSwitch

	isSwitch:
		ld   b,(hl)
		inc  hl

	notSwitch:
		
		call $489E


		jp $4552 ; jump back
		
.ENDS



.bank $23 .slot 1
.org $4000 - $4000 ;bank 23, position 4000 should contain the rombank number
.SECTION "fixROMBankNumber" OVERWRITE
		.db $23
.ENDS

;end of patch for chest open bug
;================================================================================