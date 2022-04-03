#include <gb/gb.h>
#include <stdint.h>

struct SSkaterBoi
{
    UBYTE SpriteIDs[6];
    uint8_t XPos;
    uint8_t YPos;
    uint8_t RenderWidth;
    uint8_t RenderHeight;

    uint8_t BalanceState;
};

void SetSpriteIndex(struct SSkaterBoi* SkaterBoi, uint8_t Index)
{
    SkaterBoi->BalanceState = Index;
    
    uint8_t Offset = 3 + ((Index) * 6);
    set_sprite_tile(3, Offset);
    set_sprite_tile(4, Offset + 1);
    set_sprite_tile(5, Offset + 2);
    set_sprite_tile(6, Offset + 3);
    set_sprite_tile(7, Offset + 4);
    set_sprite_tile(8, Offset + 5);
}

void InitSkaterBoi(struct SSkaterBoi* SkaterBoiPtr)
{
    // He was a skater boi
    SkaterBoiPtr->XPos = 80;
	SkaterBoiPtr->YPos = 101;
	SkaterBoiPtr->RenderWidth = 16;
	SkaterBoiPtr->RenderHeight = 16;

    SkaterBoiPtr->SpriteIDs[0] = 3;
    SkaterBoiPtr->SpriteIDs[1] = 4;
    SkaterBoiPtr->SpriteIDs[2] = 5;
    SkaterBoiPtr->SpriteIDs[3] = 6;
    SkaterBoiPtr->SpriteIDs[4] = 7;
    SkaterBoiPtr->SpriteIDs[5] = 8;

    move_sprite(3, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos);
	move_sprite(4, SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos);
    move_sprite(5, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos + 8);
    move_sprite(6, SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos + 8);
    move_sprite(7, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos + 16);
    move_sprite(8, SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos + 16);

	SetSpriteIndex(SkaterBoiPtr, 1);
    // She said see ya later boi
}

void SetSkaterBoiPos (struct SSkaterBoi* SkaterBoiPtr, uint8_t NewX, uint8_t NewY)
{
    if( NewX != SkaterBoiPtr->XPos)
    {
        SkaterBoiPtr->XPos = NewX;
        SkaterBoiPtr->YPos = NewY;

        move_sprite(3, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos);
        move_sprite(4, SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos);
        move_sprite(5, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos + 8);
        move_sprite(6, SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos + 8);
        move_sprite(7, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos + 16);
        move_sprite(8, SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos + 16);
    }
}