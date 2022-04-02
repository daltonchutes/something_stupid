#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>
#include <gb/drawing.h>
#include "main.h"

#define BARMAX 100

int ManualBar = 50;
int ManualBarDar = -1;
int ManualBarInfluence = 10;

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
    return MENUSTATE;
}

int GameState() // State 1 
{
    ManualBar += ManualBarDar*ManualBarInfluence;
    return GAMESTATE;
}