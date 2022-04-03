#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>
#include <gb/drawing.h>

#include "main.h"
#include "Manual_data.c"
#include "Manual_map.c"
#include "skater_boi.c"
#include "balance_arrow.c"
#include "Sprite_Data.c"

#define BARMAX 146
#define COUNTERMAX 100

int ManualBar = 88;
int ManualBarDar = -1;
int ManualBarInfluence = 1;
int Counter = 0;

struct SSkaterBoi SkaterBoi;
struct SBalanceArrow BalanceArrow;

int MenuState() // State 0 
{
    puts("Main Menu!");
    return GAMESTATELOAD;
}

int GameState() // State 1 
{
    Counter++;
    if(Counter > COUNTERMAX){

        ManualBar += ManualBarDar*ManualBarInfluence; // Increment the manual bar 

        // High End 
        if(ManualBar > 157){
            ManualBar = 157;
        }
        // Low End 
        if(ManualBar < 11){
            ManualBar = 11;
        }

        // Reset the time counter 
        Counter = 0;
    }

    SetBalanceArrowPos(&BalanceArrow, ManualBar, 125); // 11 - 157
    return GAMESTATE;
}

int GameLoadState() // State 2 
{
    set_bkg_data(0, 145, Manual_data);
    set_bkg_tiles(0, 0, 20, 18, Manual_map);

    set_sprite_data(0, 22, SpriteData);
    InitSkaterBoi(&SkaterBoi);
    InitBalanceArrow(&BalanceArrow);

    SHOW_BKG;
    return GAMESTATE;
}