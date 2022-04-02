#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>

// FUNCTIONS
void Init();
void Update();
void UpdateGame();

// INPUT
void PollInput();
void OnPushUp();
void OnPushDown();
void OnPushLeft();
void OnPushRight();

// VARIABLES


void main()
{
	Init();
	Update();
}

void Init()
{
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
