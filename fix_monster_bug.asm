.define byte16 $dd
.define byte8  $30

.bank $0d .slot 1
.org $61bc - $4000
.SECTION "fix_0d_61bc" OVERWRITE
		.db byte8
		.db byte16
.ENDS


.bank $0d .slot 1
.org $61d9 - $4000
.SECTION "fix_0d_61d9" OVERWRITE
		.db byte8
		.db byte16
.ENDS


.bank $0d .slot 1
.org $6264 - $4000
.SECTION "fix_0d_6264" OVERWRITE
		.db byte8
		.db byte16
.ENDS


.bank $0d .slot 1
.org $62a6 - $4000
.SECTION "fix_0d_62a6" OVERWRITE
		.db byte8
		.db byte16
.ENDS


.bank $0d .slot 1
.org $6337 - $4000
.SECTION "fix_0d_6337" OVERWRITE
		.db byte8
		.db byte16
.ENDS


.bank $3b .slot 1
.org $4bf8 - $4000
.SECTION "fix_3b_4bf8" OVERWRITE
		.db byte8
		.db byte16
.ENDS


.bank $3e .slot 1
.org $5ad8 - $4000
.SECTION "fix_3e_5ad8" OVERWRITE
		.db byte8
		.db byte16
.ENDS


.bank $5c .slot 1
.org $484f - $4000
.SECTION "fix_5c_484f" OVERWRITE
		.db byte8
		.db byte16
.ENDS


.bank $6c .slot 1
.org $5a97 - $4000
.SECTION "fix_6c_5a97" OVERWRITE
		.db byte8
		.db byte16
.ENDS


.bank $b0 .slot 1
.org $4bda - $4000
.SECTION "fix_b0_4bda" OVERWRITE
		.db byte8
		.db byte16
.ENDS


.bank $bc .slot 1
.org $4e64 - $4000
.SECTION "fix_bc_4e64" OVERWRITE
		.db byte8
		.db byte16
.ENDS


.bank $e6 .slot 1
.org $5e84 - $4000
.SECTION "fix_e6_5e84" OVERWRITE
		.db byte8
		.db byte16
.ENDS



