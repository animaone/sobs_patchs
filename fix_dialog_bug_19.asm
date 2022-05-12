



;start of patch for dialog 0x19 byte bug
;============================================================================================================
.bank $0E .slot 1


.org $7c1c - $4000 ;code cave(overwrite in spanish ROM)
.SECTION "patchDialog_byte19" OVERWRITE

patchDialog_byte19:

	@compare_5e:
		cp   a,$5e
		jr   nz,@compare_5f
		ld   de,$5001
		ld   a,b
		jr   @end
	@compare_5f:
		cp   a,$5f
		jr   nz,@compare_18
		ld   de,$6001
		ld   a,b
		jr   @end
	@compare_18:
		cp   a,$18
		jr   nz,@compare_19
		ld   de,$4000
		ld   a,b
		ld   b,$23
		jr   @end1
	@compare_19:
		cp   a,$19
		jr   nz,@end_4001
		ld   de,$5000
		ld   a,b
		ld   b,$23
		jr   @end1
	@end_4001:
		ld   de,$4001
	@end:
		ld   b,$3d
	@end1:
		swap a
		ld   h,a
		and  a,$f0
		ld   l,a
		ld   a,h
		and  a,$0f
		ld   h,a
		add  hl,de
		ld   d,h
		ld   e,l
		ld   a,($cdb3)
		swap a
		ld   h,a
		and  a,$f0
		ld   l,a
		ld   a,h
		and  a,$0f
		or   a,$80
		ld   h,a
		ld   c,$10
		jp   $48fd
		
		
.ENDS