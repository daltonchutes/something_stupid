#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>

#include "main.h"
#include "states.h"


void main()
{
	Init();
	Update();
}

void Init()
{
	CurrentState = 1;

	SHOW_BKG;
	SHOW_SPRITES;
	DISPLAY_ON;
	puts("bro");
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
		case 0: // Menu State!
			CurrentState = MenuState();
			// Menu code goes here
			break;
		case 1: // Game State!
			CurrentState = GameState();
			// Game code goes here
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
