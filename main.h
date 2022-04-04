#ifndef MAIN_H
#define MAIN_H

#define SPLASHSTATE 0
#define SPLASHSTATELOAD 1
#define MENUSTATE 2
#define MENUSTATELOAD 3
#define GAMESTATE 4
#define GAMESTATELOAD 5
#define GAMESTATEFAIL 6
#define GAMESTATERESET 7


// FUNCTIONS
void Init();
void Update();
void UpdateGame();
void vbl_update();

// INPUT
void PollInput();
void OnPushUp();
void OnPushDown();
void OnPushLeft();
void OnPushRight();

#endif