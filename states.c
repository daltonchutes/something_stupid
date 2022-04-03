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
#define COUNTERMAX 50
#define PLAYERCOUNTERMAX 200
#define SKATERCENTER 80
#define PLAYERXOFFSETMAX 10
#define PLAYERXOFFSETMIN -10

int ManualBar = 88;
int ManualBarDar = -1;
int ManualBarInfluence = 1;
int Counter = 0;
int PlayerCounter = 0; 
int PlayerXOffset = 0;

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

        switch(joypad()){
            case J_LEFT: 
                ManualBarInfluence -= 1;
                break;
            case J_B: 
                ManualBarInfluence -= 1;
                break;
            case J_RIGHT: 
                ManualBarInfluence += 1;
                break;
            case J_A: 
                ManualBarInfluence += 1;
                break;
        }

        ManualBar += ManualBarInfluence; // Increment the manual bar 

        // High End 
        if(ManualBar > 157){
            ManualBar = 157;
        }

        if (ManualBar > 104)
        {
            SetSpriteIndex(&SkaterBoi, 2);
        }
        else if (ManualBar > 56)
        {
            SetSpriteIndex(&SkaterBoi, 1);
        }
        else
        {
            SetSpriteIndex(&SkaterBoi, 0);
        }

        // Low End 
        if(ManualBar < 11){
            ManualBar = 11;
        }
        // Reset the time counter 
        Counter = 0;
    }

    PlayerCounter++;
    if(PlayerCounter > PLAYERCOUNTERMAX)
    {
        if (ManualBar > 124)
        {
            PlayerXOffset++;
            if(PlayerXOffset > 10)
            {
                PlayerXOffset = 10;
            }
        }
        else if (ManualBar <= 36)
        {
            PlayerXOffset--;
            if(PlayerXOffset < -10)
            {
                PlayerXOffset = -10;
            }           
        } 
        PlayerCounter = 0 ;   
    }

    SetSkaterBoiPos(&SkaterBoi, SKATERCENTER+PlayerXOffset, 101); // 70 - 90 
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