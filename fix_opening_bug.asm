



;start of patch for opening bug
;============================================================================================================
.bank $0E .slot 1


.org $63e7 - $4000 ;jump to patch code cave
.SECTION "patchJump_opening" OVERWRITE
		
		jp patchedSwitchBytes_opening
		
.ENDS


.org $7c8a - $4000 ;code cave
.SECTION "patchJumpTarget_opening" OVERWRITE
	
	patchedSwitchBytes_opening:
			
			
			cp   a,$5e
			jr   nz,rome_63ed
			ld   d,$50
			ld   b,$3d
			jr ending
		rome_63ed:
			cp   a,$5f
			jr   nz,@val_18
			ld   d,$60
			ld   b,$3d
			jr ending
		@val_18:
			cp   a,$18
			jr   nz,@val_19
			ld   d,$40
			ld   b,$23
			dec  e ; slide tile one byte (hack for new fonts)
			jr ending
		@val_19:
			cp   a,$19
			jr   nz,ending1
			ld   d,$50
			ld   b,$23
			dec  e ; slide tile one byte (hack for new fonts)
			jr ending
		ending1:
			ld   b,$3d
		ending:
			add  hl,de
			pop  de
			call $06dd
			pop  hl
			pop  de
			ret  
		
		
.ENDS