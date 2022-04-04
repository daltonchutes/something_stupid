#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>

#define SCOREX 128


int NumbersArray[] = {
    // Array of tiles we're using for numbers
    33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43
};

void InitLevelScore(){
    set_sprite_tile(9,NumbersArray[0]);
    set_sprite_tile(10,NumbersArray[0]);
    set_sprite_tile(11,NumbersArray[0]);
    set_sprite_tile(12,NumbersArray[0]);
    move_sprite(12, 136, 17);
    move_sprite(11, 144, 17);
    move_sprite(10, 152, 17);
    move_sprite(9,  160, 17);
}

void UpdateLevelScore(int s1, int s2, int s3, int s4){
    set_sprite_tile(9, NumbersArray[s1]);
    set_sprite_tile(10, NumbersArray[s2]);
    set_sprite_tile(11, NumbersArray[s3]);
    set_sprite_tile(12, NumbersArray[s4]);
}
