;Star Ocean Blue Sphere Spanish Translation GBC ROM patch: fix items names font rendering
;to be applied in ROM with sha256sum: b5efa738e9112f225e9121bdee076f472d4f0a5f1845179c413f8ee5f9ff8bbe 
;Patch made by Anima C13.
;https://github.com/animaone

.MEMORYMAP
	SLOTSIZE $4000
	DEFAULTSLOT 1
	SLOT 0 $0000
	SLOT 1 $4000
.ENDME

.ROMBANKSIZE $4000
.ROMBANKS 256


.bank $0E .slot 1


.BACKGROUND "..\sobs_sp.gbc"


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