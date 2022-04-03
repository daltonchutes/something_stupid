#include <gb/gb.h>
#include <stdint.h>

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
    //set_sprite_data(ARROW_TILE_START, ARROW_TILE_NUM, SpriteData); 
	BalanceArrow->RenderWidth = 16;
	BalanceArrow->RenderHeight = 16;

	set_sprite_tile(0, 0);
	BalanceArrow->SpriteIDs[0] = 0;
	 
    set_sprite_tile(1, 1);
	BalanceArrow->SpriteIDs[1] = 1;

	set_sprite_tile(2, 2);
	BalanceArrow->SpriteIDs[2] = 2;
	
    SetBalanceArrowPos(BalanceArrow, ARROW_CENTER, 125);    

    BalanceArrow->CurrentOffset = ARROW_CENTER;
}
