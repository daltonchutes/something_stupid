#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>

#include "main.h"
#include "states.h"


// VARIABLES
int CurrentState; 

void main()
{
	Init();
	Update();
}

void Init()
{
	CurrentState = MENUSTATE;

	SHOW_BKG;
	SHOW_SPRITES;
	DISPLAY_ON;
}

void Update()
{
	while (1)
	{
		PollInput();
		UpdateGame();
	}
}

void UpdateGame()
{
	switch(CurrentState)
	{
		case MENUSTATE: // Menu State!
			CurrentState = MenuState();
			break;
		case GAMESTATE: // Game State!
			CurrentState = GameState();
			break;
		case GAMESTATELOAD: // Game load State!
			CurrentState = GameLoadState();
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
