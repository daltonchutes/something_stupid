#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>

#define SCOREX 128


int NumbersArray[] = {
    // Array of tiles we're using for numbers
    33, 34, 35, 36, 37, 38, 39, 40, 41, 42
};

int SkateArray[] = {
    43, 44, 45, 46, 47, 48 // 48 is blank
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

void InitSkatePickupSprite(){
    set_sprite_tile(13, 43);
}

void ChangeSkatePickupSprite(int index){
    set_sprite_tile(13, SkateArray[index]);
}

void MoveSkatePickupSprite(int x, int y){
    move_sprite(13, x, y);
}

void InitSkateDisplay(){
    set_sprite_tile(14, SkateArray[5]);
    set_sprite_tile(15, SkateArray[5]);
    set_sprite_tile(16, SkateArray[5]);
    set_sprite_tile(17, SkateArray[5]);
    set_sprite_tile(18, SkateArray[5]);
    move_sprite(14, 8, 16);
    move_sprite(15, 16, 16);
    move_sprite(16, 24, 16);
    move_sprite(17, 32, 16);
    move_sprite(18, 40, 16);
}

void SkateDisplayShowNext(int stage){
    switch(stage){
        case 0:
            set_sprite_tile(14, SkateArray[5]);
            set_sprite_tile(15, SkateArray[5]);
            set_sprite_tile(16, SkateArray[5]);
            set_sprite_tile(17, SkateArray[5]);
            set_sprite_tile(18, SkateArray[5]);
            break;
        case 1:
            set_sprite_tile(14, SkateArray[0]);
            set_sprite_tile(15, SkateArray[5]);
            set_sprite_tile(16, SkateArray[5]);
            set_sprite_tile(17, SkateArray[5]);
            set_sprite_tile(18, SkateArray[5]);
            break;
        case 2:
            set_sprite_tile(14, SkateArray[0]);
            set_sprite_tile(15, SkateArray[1]);
            set_sprite_tile(16, SkateArray[5]);
            set_sprite_tile(17, SkateArray[5]);
            set_sprite_tile(18, SkateArray[5]);
            break;
        case 3:
            set_sprite_tile(14, SkateArray[0]);
            set_sprite_tile(15, SkateArray[1]);
            set_sprite_tile(16, SkateArray[2]);
            set_sprite_tile(17, SkateArray[5]);
            set_sprite_tile(18, SkateArray[5]);
            break;
        case 4:
            set_sprite_tile(14, SkateArray[0]);
            set_sprite_tile(15, SkateArray[1]);
            set_sprite_tile(16, SkateArray[2]);
            set_sprite_tile(17, SkateArray[3]);
            set_sprite_tile(18, SkateArray[5]);
            break;
        case 5:
            set_sprite_tile(14, SkateArray[0]);
            set_sprite_tile(15, SkateArray[1]);
            set_sprite_tile(16, SkateArray[2]);
            set_sprite_tile(17, SkateArray[3]);
            set_sprite_tile(18, SkateArray[4]);
            break;
    }
}