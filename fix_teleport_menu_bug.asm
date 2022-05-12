



;start of patch for teleport menu bug
;============================================================================================================
.bank $0E .slot 1


.org $5aa4 - $4000 ;(original location) jump to patch code cave
.SECTION "patchJump_teleport_menu" OVERWRITE
		
		jp patchedSwitchBytes_teleport_menu
		
.ENDS


.org $7090 - $4000 ;code cave
.SECTION "patchJumpTarget_teleport_menu" OVERWRITE
	
	patchedSwitchBytes_teleport_menu:
			
			ld   de,$4001

			@compare_5e:
				cp   a,$5e
				jr   nz,@compare_5f
				ld   d,$50
				call $40b9
				jr   @end_5e_5f

			@compare_5f:                   
				cp   a,$5f
				jr   nz,@compare_18
				ld   d,$60
				call $40b9
				jr   @end_5e_5f

			@compare_18:                   
				cp   a,$18
				jr   nz,@compare_19
				ld   d,$40
				call $40b9
				jr   @end_18_19

			@compare_19:                   
				cp   a,$19
				jr   nz,@end_5e_5f
				ld   d,$50
				call $40b9
				jr   @end_18_19

			@end_5e_5f:
				ld   b,a
				ld   a,($cdb3)
				swap a
				ld   h,a
				and  a,$f0
				ld   l,a
				ld   a,h
				and  a,$0f
				or   a,$80
				ld   h,a
				push hl
				ld   a,b
				swap a
				ld   h,a
				and  a,$f0
				ld   l,a
				ld   a,h
				and  a,$0f
				ld   h,a
				add  hl,de
				pop  de

				;select font rombank
				ld   b,$3d

				;go back to flow
				jp $5adb

			@end_18_19:
				ld   b,a
				ld   a,($cdb3)
				swap a
				ld   h,a
				and  a,$f0
				ld   l,a
				ld   a,h
				and  a,$0f
				or   a,$80
				ld   h,a
				push hl
				ld   a,b
				swap a
				ld   h,a
				and  a,$f0
				ld   l,a
				ld   a,h
				and  a,$0f
				ld   h,a
				dec  e ; slide tile one byte (hack for new fonts)
				add  hl,de
				pop  de

				;select font rombank
				ld   b,$23

				;go back to flow
				jp $5adb



				

.ENDS