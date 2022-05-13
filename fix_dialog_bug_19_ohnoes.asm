



;start of patch for dialog 0x19 byte bug (another)
;============================================================================================================
.bank $0E .slot 1


.org $7e00 - $4000 ;very far code cave is overwritten in sp rom
.SECTION "patchDialog_byte19_ohnoes" OVERWRITE

patchDialog_byte19_ohnoes:

		cp a, $5f
		jr z, @end
		cp a, $19
		jr z, @end
		cp a, $18
		ret nz
	@end:
		jp $40e8
		
		
.ENDS