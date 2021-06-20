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


.BACKGROUND "..\!out.gbc"



.INCLUDE "fix_item_bug.asm"
.INCLUDE "fix_monster_bug.asm"
.INCLUDE "fix_profiles_bug.asm"
.INCLUDE "fix_opening_bug.asm"