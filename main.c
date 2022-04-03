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
extern const unsigned char * song_Data[];
extern const unsigned char * themesong_Data[];

void main()
{
	Init();
	Update();
}

void vbl_update() {
 vbl_count ++;
}

void Init()
{
	CurrentState = SPLASHSTATELOAD;

    disable_interrupts();
	
	add_VBL(vbl_update);

    gbt_play(song_Data, 2, 7);
    gbt_loop(1);

    set_interrupts(VBL_IFLAG);
    enable_interrupts();	

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
		case GAMESTATELOAD: // Game load State!
			CurrentState = GameLoadState();
			break;
		case GAMESTATERESET: // Game Reset State!
			CurrentState = GameResetState();
			break;
	}
}

void PollInput()
{
	switch(joypad())
	{
		case J_UP:
			OnPushUp();
			break;
		case J_DOWN:
			OnPushDown();
			break;
		case J_LEFT:
			OnPushLeft();
			break;
		case J_RIGHT:
			OnPushRight();
			break;
		default:
			break;
	}
}

void OnPushUp()
{

}

void OnPushDown()
{

}

void OnPushLeft()
{

}

void OnPushRight()
{

}
