del sobs_sp.o

wla-gb -o sobs_sp.o sobs_sp.asm

copy ..\sobs_sp.gbc sobs_sp_patched.gbc

wlalink link sobs_sp_patched.gbc

del sobs_sp.o

pause