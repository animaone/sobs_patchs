



;start of patch for centering monster name
;============================================================================================================
.bank $0d .slot 1

;; the original function only counts the number bytes
.org $61be - $4000;jump to patch code cave
.SECTION "patchcall_center_monster_name" OVERWRITE
		
		call patchcallTarget_center_monster_name
		nop
		nop
		nop
		nop
		nop
		nop
		
.ENDS


.org $6e30 - $4000 ;code cave
.SECTION "patchcallTarget_center_monster_name" OVERWRITE
	
	patchcallTarget_center_monster_name:
		
		ld   d,$00

		@start:
			inc  d
			ldi  a,(hl)

		@compare_5e:
			cp a, $5e
			jr nz, @compare_5f
			jr @decrement
			
		@compare_5f:
			cp a, $5f
			jr nz, @compare_18
			jr @decrement

		@compare_18:
			cp a, $18
			jr nz, @compare_19
			jr @decrement

		@compare_19:
			cp a, $19
			jr nz, @end
			jr @decrement

		@decrement:
			dec d

		@end:
			cp   a,$00
			jr   nz,@start

		;slide one more tile...
		;	ld   a,$00
		;	cp   d
		;	jr   z, @counter_is_zero
		;	dec d
		;@counter_is_zero:
		;	ld d,$2
		
		;	rr   d  ;division by two		
		;	inc  d
			
			dec d ;because counter starts in 1
			ret

		
		
.ENDS