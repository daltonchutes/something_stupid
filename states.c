#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>
#include <gb/drawing.h>

#include "main.h"
#include "Manual_data.c"
#include "Manual_map.c"
#include "skater_boi.c"
#include "balance_arrow.c"

#define BARMAX 100

int ManualBar = 50;
int ManualBarDar = -1;
int ManualBarInfluence = 10;

struct SSkaterBoi SkaterBoi;
struct SBalanceArrow BalanceArrow;

/////////////////////////////////////////////////////////////////////////
// Returning values trasition states
// 0 = Main Menu
// 1 = 
// 2 = Game Loop 
//
/////////////////////////////////////////////////////////////////////////

int MenuState() // State 0 
{
    puts("Main Menu!");
    return GAMESTATELOAD;
}

int GameState() // State 1 
{
    ManualBar += ManualBarDar*ManualBarInfluence;
    return GAMESTATE;
}

int GameLoadState() // State 2 
{
    set_bkg_data(0, 145, Manual_data);
    set_bkg_tiles(0, 0, 20, 18, Manual_map);
    InitSkaterBoi(&SkaterBoi);
    InitBalanceArrow(&BalanceArrow);

    SHOW_BKG;
    return GAMESTATE;
}