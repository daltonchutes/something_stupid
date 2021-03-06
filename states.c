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
#include "MainMenu_data.c"
#include "skater_boi.c"
#include "balance_arrow.c"
#include "Sprite_Data.c"
#include "random.c"
#include "numbers.c"
#include "gbt_player.h"

#define BARMAX 146
#define COUNTERMAX 200
#define PLAYERCOUNTERMAX 200 // Countmax * 4
#define SKATERCENTER 80
#define MANUALBARCENTER 84
#define PLAYERXOFFSETMAX 15
#define PLAYERXOFFSETMIN -15
#define PLAYERSPEED 2

uint16_t MarkerPos;
uint16_t PlayerPos;
int16_t MarkerSpeed; 
int8_t MarkerDirection;
int8_t ButtonPressed;

uint8_t Counter;
uint8_t GotoFailState;

uint16_t score1;
uint8_t score2;
uint8_t score3;
uint8_t score4;

uint8_t PickupX;
uint8_t PickupNumber;

uint8_t FailStateTimer = 0;

const int difficultyInfluence[] = {
    1, // Level 0 
    2, // Level 1
    4, // Level 2
    6, // Level 3
    8, // Level 4
    10, // Level 5
    14, // Level 6
    18, // Level 7
    22, // Level 8
    30, // Level 9

};

const int PickupXArray[] = {
    50,  // S
    120, // K
    50,  // A
    120, // T
    50   // E
};


extern const unsigned char * GameOver_Data[];
extern const unsigned char * ThemeSong_Data[];
extern const unsigned char * ManualStart_Data[];

struct SSkaterBoi SkaterBoi;
struct SBalanceArrow BalanceArrow;

void LoadMusic(const unsigned char * MusicData[], int loop, int speed)
{
    // Load The Music
    disable_interrupts();

    gbt_play(MusicData, 2, speed);
    gbt_loop(loop);

    enable_interrupts();	
}

/********************************************************************************************************
*                                         Main Game Loop Starts here
********************************************************************************************************/

int GameState() //Main Game state 
{

    // Controls 
    switch(joypad()){
        case J_LEFT: 
            if(ButtonPressed == 0){
                MarkerDirection = -1;
                MarkerSpeed -= 15;
                //MarkerPos -= 2 << 4;
                ButtonPressed = 1;
            }
            break;
        case J_B: 
            if(ButtonPressed == 0){
                MarkerDirection = -1;
                MarkerSpeed -= 15;
                //MarkerPos -= 2 << 4;
                ButtonPressed = 1;
            }
            break;
        case J_RIGHT: 
            if(ButtonPressed == 0){
                MarkerDirection = 1;
                MarkerSpeed += 15;
                //MarkerPos += 2 << 4;
                ButtonPressed = 1;
            }
            break;
        case J_A: 
            if(ButtonPressed == 0){
                MarkerDirection = 1;
                MarkerSpeed += 15;
                //MarkerPos += 2 << 4;
                ButtonPressed = 1;
            }
            break;
        default:
            ButtonPressed = 0;
            break;
    }

    // Counting when we should shift the marker
    //Counter++;
    //if(Counter > COUNTERMAX){
    //    MarkerDirection = randomDir();
    //    MarkerSpeed += 10;
    //    Counter = 0;
    //}

    // Cap Marker Speed
    MarkerSpeed += difficultyInfluence[score4] * MarkerDirection;
    if(MarkerSpeed > 50 ){
        MarkerSpeed = 50;
    }
    if(MarkerSpeed < -50 ){
        MarkerSpeed = -50;
    }

    MarkerPos += MarkerSpeed;

    // Change the image of the skater
    if (MarkerPos>>4 > 108)
    {
        SetSpriteIndex(&SkaterBoi, 2);
        PlayerPos+=PLAYERSPEED;
        score1+=10;
    }
    else if (MarkerPos>>4 > 56)
    {
        SetSpriteIndex(&SkaterBoi, 1);
        score1+=5;
    }
    else
    {
        SetSpriteIndex(&SkaterBoi, 0);
        PlayerPos-=PLAYERSPEED;
        score1+=10;
    }

    // Modifiy the score
    if(score1>>4 >= 10){
        score1 = 0;
        score2++;
    }
    if(score2 >= 10){
        score2 = 0;
        score3++;
    }
    if(score3 >= 10){
        score3 = 0;
        score4++; 
    }

    // Determine if we've failed
    if(MarkerPos>>4 > 157){
        GotoFailState = 1;
        MarkerPos = 157 << 4;
        SetSpriteIndex(&SkaterBoi, 4);
    }

    if(MarkerPos>>4 < 11){
        GotoFailState = 1;
        MarkerPos = 11 << 4;
        SetSpriteIndex(&SkaterBoi, 3);
    }

    // Pickup Skate
    if(PlayerPos>>4 < PickupXArray[PickupNumber] && PlayerPos>>4 > PickupXArray[PickupNumber]-16)
    {
        // Move the pickup
        score4 += 1;
        PickupNumber++;
        ChangeSkatePickupSprite(PickupNumber);
        SkateDisplayShowNext(PickupNumber);
    }


    // Update scores and Positions of Sprites on the screen.
    SetSkaterBoiPos(&SkaterBoi, PlayerPos>>4, 101); // 70 - 90 
    UpdateLevelScore(score1>>4, score2, score3, score4);
    SetBalanceArrowPos(&BalanceArrow, MarkerPos >> 4, 125); // 11 - 157
    MoveSkatePickupSprite(PickupXArray[PickupNumber],  116);

    if(GotoFailState == 1){
        return GAMESTATELOADFAIL;
    }else{
        return GAMESTATE;
    }

    
}

/********************************************************************************************************
*                                         Main Game Loop Ends here
********************************************************************************************************/

int SplashLoadState()
{
    return SPLASHSTATE;    
}

int SplashState()
{
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
        case J_START:
            return GAMESTATELOAD;
            break;
    }
    return MENUSTATE;
}

int GameLoadState() // State 2 
{
    set_bkg_data(0, 154, Manual_data);
    set_bkg_tiles(0, 0, 20, 18, Manual_map);

    LoadMusic(ThemeSong_Data, 1, 7);
    
    MarkerPos = MANUALBARCENTER << 4;
    PlayerPos = SKATERCENTER << 4;
    MarkerDirection = randomDir();
    ButtonPressed = 0;
    score1 = 0;
    score2 = 0;
    score3 = 0;
    score4 = 0;
    PickupNumber = 0;
    ChangeSkatePickupSprite(0);


    set_sprite_data(0, 21, SpriteData);
    set_sprite_data(21, 12, SkaterFailSpriteData);
    set_sprite_data(33, 15, NumbersData);
    
    InitSkaterBoi(&SkaterBoi);
    InitBalanceArrow(&BalanceArrow);
    InitSkatePickupSprite();
    InitLevelScore();
    InitSkateDisplay();
    SkateDisplayShowNext(0);

    //UpdateLevelNumber(Level);

    SHOW_BKG;
    return GAMESTATE;
}


int GameResetState() // State 3  
{
    LoadMusic(ThemeSong_Data, 1, 7);

    MarkerPos = MANUALBARCENTER << 4;
    PlayerPos = SKATERCENTER << 4;
    MarkerSpeed = 0; 
    MarkerDirection = randomDir();
    ButtonPressed = 0;
    PickupNumber = 0;
    ChangeSkatePickupSprite(0);

    Counter = 0;
    GotoFailState = 0;

    score1 = 0;
    score2 = 0;
    score3 = 0;
    score4 = 0;
    return GAMESTATE;
}

int GameLoadFailState()
{
    FailStateTimer = 0;
    LoadMusic(GameOver_Data, 2, 7);
    return GAMESTATEFAIL;
}

int GameFailState()
{
    FailStateTimer++;
    if (FailStateTimer > 100)
    {
        LoadMusic(GameOver_Data, 0, 0);
    
        switch(joypad()){
            case J_START:
            case J_SELECT:
            case J_A:
            case J_B:
                FailStateTimer = 0;
                return GAMESTATERESET;
        }
    }
    return GAMESTATEFAIL;
}
