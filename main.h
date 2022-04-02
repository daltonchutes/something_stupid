#ifndef MAIN_H
#define MAIN_H

#define MENUSTATE 0
#define GAMESTATE 1
#define GAMESTATELOAD 2

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

#endif