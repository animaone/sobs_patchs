


;start of patch for profiles switch bytes 0x18 + 0x19
;============================================================================================================
.bank $B1 .slot 1


.org $6a77 - $4000 ;fix profile name top line(allow using 8 pixels height font)
.SECTION "profile_name_jump" OVERWRITE
	jp profile_name_draw
.ENDS




.org $7f16 - $4000 ;overwrite previous patch in spanish rom
.SECTION "jump_when_cp_18_1" OVERWRITE
	jp compare_patch_1; old was cp a,$18
.ENDS

.org $7f66 - $4000 ;overwrite previous patch in spanish rom
.SECTION "jump_when_cp_18_2" OVERWRITE
	jp compare_patch_2; old was cp a,$18
.ENDS




.org $7c6d - $4000 ;
.SECTION "patch_profiles_bug_1" OVERWRITE
	;-------------------------------------------
compare_patch_1:
	@compare_18:
						cp   a,$18
						jr   nz,@compare_19
						ld   bc,$4000
						ld   a,(de)
						inc  de
						push af
						ld   a,$23
						ld   ($cfff),a
						pop  af
						jp   $7f32
						
	@compare_19:
						cp   a,$19
						jp   nz,$7f28
						ld   bc,$5000
						ld   a,(de)
						inc  de
						push af
						ld   a,$23
						ld   ($cfff),a
						pop  af
						jp   $7f32
	;-------------------------------------------
.ENDS


.SECTION "patch_profiles_bug_2" OVERWRITE
compare_patch_2:
	@compare_18:
						cp   a,$18
						jr   nz,@compare_19
						ld   de,$4000
						ld   a,(hl)
						inc  hl
						push af
						ld   a,$23
						ld   ($cfff),a
						pop  af
						jp   $7f82
						
	@compare_19:
						cp   a,$18
						jp   nz,$7f78
						ld   de,$5000
						ld   a,(hl)
						inc  hl
						push af
						ld   a,$23
						ld   ($cfff),a
						pop  af
						jp   $7f82
	;-------------------------------------------
.ENDS


;fix profile name top line(allow using 8 pixels height font)
.SECTION "draw_profile_name_and_line" OVERWRITE

	profile_name_draw:
	
	;top white line
		
		ld   a,(hl)
		xor  a,$ff
		ldi  (hl),a
		ld   a,(hl)
		xor  a,$ff
		ldi  (hl),a
		
		;ld   a,$00
		;ldi  (hl),a
		;ld   a,(hl)
		;xor  a,$ff
		;ldi  (hl),a
		
		
		ld   c,$07
drawloop:
		ld   a,$ff
		ldi  (hl),a
		ld   a,(hl)
		xor  a,$ff
		ldi  (hl),a
		dec  c
		jr   nz,drawloop
		
		
		;go back
		jp $6a86
.ENDS


