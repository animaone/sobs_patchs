



;start of patch for opening bug 1
;============================================================================================================
.bank $A8 .slot 1


.org $5480 - $4000 ;jump to patch code cave
.SECTION "patchJump_opening_1" OVERWRITE
		
		jp patchedSwitchBytes_opening_1
		
.ENDS


.org $7490 - $4000 ;code cave
.SECTION "patchJumpTarget_opening_1" OVERWRITE
	
	patchedSwitchBytes_opening_1:
			
			cp   a,$5e
			jr   z,@have_switch
			cp   a,$18
			jr   z,@have_switch
			cp   a,$19
			jr   z,@have_switch
			cp   a,$5f
			jp   nz,$548a
		@have_switch:
			ld   b,a
			ldi  a,(hl)
		jp $548a

		
		
.ENDS