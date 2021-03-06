#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>

#include "main.h"
//#include "Sprite_Data.c"
#include "states.h"
#include "gbt_player.h"


// VARIABLES
int CurrentState; 
int vbl_count;

void vbl_update() {
 vbl_count ++;
}

void main()
{
	Init();
	Update();
}

void Init()
{

	// Do some stuff
    disable_interrupts();
	add_VBL(vbl_update);
    set_interrupts(VBL_IFLAG);
    enable_interrupts();	

	CurrentState = MENUSTATELOAD;
	SHOW_BKG;
	SHOW_SPRITES;
	DISPLAY_ON;
}

void Update()
{
	while (1)
	{
		if(vbl_count == 0){
			wait_vbl_done();
		}
		vbl_count = 0;

		//PollInput();
		UpdateGame();
		gbt_update();

	}
}

void UpdateGame()
{
	switch(CurrentState)
	{
		case SPLASHSTATELOAD:
			CurrentState = SplashLoadState();
			break;
		case SPLASHSTATE:
			CurrentState = SplashState();
			break;
		case MENUSTATELOAD:
			CurrentState = MenuLoadState();
			break;
		case MENUSTATE: // Menu State!
			CurrentState = MenuState();
			break;
		case GAMESTATE: // Game State!
			CurrentState = GameState();
			break;
		case GAMESTATEFAIL: // Game State!
			CurrentState = GameFailState();
			break;
		case GAMESTATELOAD: // Game load State!
			CurrentState = GameLoadState();
			break;
		case GAMESTATERESET: // Game Reset State!
			CurrentState = GameResetState();
			break;
		case GAMESTATELOADFAIL:
			CurrentState = GameLoadFailState();
			break;
	}
}

int sign(int x) {
    return (x > 0) - (x < 0);
}

int min(int a, int b) {
    if (a > b)
        return b;
    return a;
}

int max(int a, int b) {
    if (a < b)
        return b;
    return a;
}
