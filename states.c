#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>
#include <gb/drawing.h>
#include <stdbool.h>

#include "main.h"
#include "Manual_data.c"
#include "Manual_map.c"
#include "Title_data.c"
#include "Title_map.c"
#include "Splash_Data.c"
#include "MainMenu_data.c"
#include "skater_boi.c"
#include "balance_arrow.c"
#include "Sprite_Data.c"
#include "random.c"
#include "numbers.c"
#include "gbt_player.h"

#define BARMAX 146
#define COUNTERMAX 50
#define PLAYERCOUNTERMAX 200 // Countmax * 4
#define SKATERCENTER 80
#define PLAYERXOFFSETMAX 15
#define PLAYERXOFFSETMIN -15

int ManualBar = 88;
int ManualBarDar = -1;
int ManualBarInfluence = 1;
int Counter = 0;
int PlayerCounter = 0; 
int InfluenceCounter = 0;
int PlayerXOffset = 0;
int Level = 1;
int LevelProgress = 0;

extern const unsigned char * GameOver_Data[];
extern const unsigned char * ThemeSong_Data[];
extern const unsigned char * ManualStart_Data[];

int InfluenceCounterMaxLevelArray[] ={
    1000, 800, 600, 500, 400, 300, 200, 100, 50, 25
};

//int CounterMaxLevelArray[] ={
//    50, 50, 45, 45, 40, 40, 35, 35, 30, 25
//};
int CounterMaxLevelArray[] ={
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1
};

struct SSkaterBoi SkaterBoi;
struct SBalanceArrow BalanceArrow;

void LoadMusic(const unsigned char * MusicData[], int loop, int speed)
{
    // Load The Music
    disable_interrupts();
	
	add_VBL(vbl_update);

    gbt_play(MusicData, 2, speed);
    gbt_loop(loop);

    set_interrupts(VBL_IFLAG);
    enable_interrupts();	
}

int SplashLoadState()
{
    set_bkg_data(0, 145, SplashBG_data);
    set_bkg_tiles(0, 0, 20, 18, SplashBG_map);

    LoadMusic(ManualStart_Data, 1, 7);

    SHOW_BKG;
    return SPLASHSTATE;    
}

int SplashState()
{
    switch(joypad())
    {
        case J_START:
        case J_A: 
            return MENUSTATELOAD;
            break;
    }
    return SPLASHSTATE;
}

int MenuLoadState()
{
    set_bkg_data(0, 148, Manual_Manny_data);
    set_bkg_tiles(0, 0, 20, 18, Manual_Manny_map);

    LoadMusic(ManualStart_Data, 1, 7);

    SHOW_BKG;
    return MENUSTATE;
}

int MenuState() // State 0 
{
    switch(joypad())
    {
        case J_A:
            return GAMESTATELOAD;
            break;
    }
    return MENUSTATE;
}

int GameState() // State 1 
{
    Counter++;
    if(Counter > CounterMaxLevelArray[Level]){

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

        // High End Fail 
        if(ManualBar > 157){
            return GAMESTATERESET;
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

        // Low End Fail
        if(ManualBar < 11){
            return GAMESTATERESET;
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

    InfluenceCounter++;
    if(InfluenceCounter > InfluenceCounterMaxLevelArray[Level])
    {
        if(randomXD() == true)
        {
            ManualBarInfluence++; 
        }
        else
        {
            ManualBarInfluence--; 
        }    
        InfluenceCounter = 0;
        LevelProgress++;
        if(LevelProgress >= 50)
        {
            Level++; 
            UpdateLevelNumber(Level);
            LevelProgress = 0;
            if(Level >= 9){
                Level = 9;
            }
        }
    }


    SetSkaterBoiPos(&SkaterBoi, SKATERCENTER+PlayerXOffset, 101); // 70 - 90 
    SetBalanceArrowPos(&BalanceArrow, ManualBar, 125); // 11 - 157
    return GAMESTATE;
}

int GameLoadState() // State 2 
{
    set_bkg_data(0, 145, Manual_data);
    set_bkg_tiles(0, 0, 20, 18, Manual_map);

    LoadMusic(ThemeSong_Data, 1, 7);

    set_sprite_data(0, 21, SpriteData);
    set_sprite_data(21, 10, NumbersData);
    set_sprite_data(31, 9, SkaterFailSpriteData);
    InitSkaterBoi(&SkaterBoi);
    InitBalanceArrow(&BalanceArrow);
    InitLevelNumber();

    UpdateLevelNumber(Level);

    SHOW_BKG;
    return GAMESTATE;
}

int GameResetState() // State 3  
{
    ManualBar = 88;
    ManualBarDar = -1;
    ManualBarInfluence = 1;
    Counter = 0;
    PlayerCounter = 0; 
    InfluenceCounter = 0;
    PlayerXOffset = 0;
    Level = 1;
    LevelProgress = 0;
    return GAMESTATE;
}

int GameFailState()
{
    return GAMESTATE;
}
