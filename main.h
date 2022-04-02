#ifndef MAIN_H
#define MAIN_H

// FUNCTIONS
void Init();
void Update();
void UpdateGame();

// VARIABLES
int CurrentState; 

// INPUT
void PollInput();
void OnPushUp();
void OnPushDown();
void OnPushLeft();
void OnPushRight();

#endif