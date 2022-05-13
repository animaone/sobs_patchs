



;start of patch for field skill bug
;============================================================================================================
.bank $00 .slot 0

;; the original function counts the number of non-switch bytes
.org $116a;jump to patch code cave
.SECTION "patchcall_field_skill_switchbyte_counter" OVERWRITE
		
		nop
		call patchcallTarget_field_skill_switchbyte_counter
		nop
		nop
		nop
		nop
		nop
		nop
		
.ENDS


.org $3b80 ;code cave
.SECTION "patchcallTarget_field_skill_switchbyte_counter" OVERWRITE
	
	patchcallTarget_field_skill_switchbyte_counter:
			cp   a,$5e
			jr   z,@end
			cp   a,$5f
			jr   z,@end
			cp   a,$18
			jr   z,@end
			cp   a,$19
			jr   z,@end
			dec  hl
		@end:
			inc  c
			ret

		
		
.ENDS