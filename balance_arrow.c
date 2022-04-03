#include <gb/gb.h>
#include <stdint.h>
#include "Sprite_Data.c"

#define ARROW_TILE_START 0
#define ARROW_TILE_NUM 3
#define ARROW_CENTER 84

struct SBalanceArrow
{
    UBYTE SpriteIDs[3];
    uint8_t XRenderPos;
    uint8_t YRenderPos;
    uint8_t RenderWidth;
    uint8_t RenderHeight;
    
    uint8_t CurrentOffset; 
};

void SetBalanceArrowPos(struct SBalanceArrow* BalanceArrow, uint8_t NewX, uint8_t NewY)
{
    BalanceArrow->XRenderPos = NewX;
    BalanceArrow->YRenderPos = NewY;

    // Move each subsequent tile downwards from the top one
	move_sprite(BalanceArrow->SpriteIDs[0], BalanceArrow->XRenderPos, BalanceArrow->YRenderPos);
	move_sprite(BalanceArrow->SpriteIDs[1], BalanceArrow->XRenderPos, BalanceArrow->YRenderPos + 8);
	move_sprite(BalanceArrow->SpriteIDs[2], BalanceArrow->XRenderPos, BalanceArrow->YRenderPos + 16);
}

void InitBalanceArrow(struct SBalanceArrow* BalanceArrow)
{
    set_sprite_data(ARROW_TILE_START, ARROW_TILE_NUM, SpriteData); 
	BalanceArrow->RenderWidth = 16;
	BalanceArrow->RenderHeight = 16;

	set_sprite_tile(ARROW_TILE_START, ARROW_TILE_START);
	BalanceArrow->SpriteIDs[0] = ARROW_TILE_START;
	
    UINT8 NextTileOffset = ARROW_TILE_START + 1;
    set_sprite_tile(NextTileOffset, NextTileOffset);
	BalanceArrow->SpriteIDs[1] = NextTileOffset;

    NextTileOffset++;
	set_sprite_tile(NextTileOffset, NextTileOffset);
	BalanceArrow->SpriteIDs[2] = NextTileOffset;
	
    SetBalanceArrowPos(BalanceArrow, ARROW_CENTER, 125);    

    BalanceArrow->CurrentOffset = ARROW_CENTER;
}
