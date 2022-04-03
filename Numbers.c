#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>

int NumbersArray[] = {
    21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31
};

void InitLevelNumber(){
    set_sprite_tile(9,NumbersArray[0]);
    move_sprite(9, 8, 16);
}

void UpdateLevelNumber(int Level){
    set_sprite_tile(9, NumbersArray[Level]);
}
