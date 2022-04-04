rem mod2gbt manualtheme.mod themesong -c 2

..\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -c -o main.o main.c
..\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -c -o states.o states.c
..\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo2 -Wf-ba2 -c -o output.o output.c
..\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -c -o gbt_player.o gbt_player.s
..\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wf-bo1 -Wf-ba1 -c -o gbt_player_bank1.o gbt_player_bank1.s

..\gbdk\bin\lcc -Wa-l -Wl-m -Wl-j -Wl-yt0x1A -Wl-yt1 -Wl-yo4 -Wl-ya0 -o Manual.gb main.o states.o output.o gbt_player.o gbt_player_bank1.o

del *.o *.lst

pause


