#include <gb/gb.h>
#include <stdint.h>

unsigned char SkaterSpriteData[] =
{
   /* Tile 0x00 */
  0x07,0x07,0x18,0x1F,0x32,0x2D,0x71,0x4E,0x70,0x4F,0xF8,0x87,0xF8,0x87,0xF8,0x87,
  0xFC,0x83,0xFE,0x81,0x7F,0x40,0x7F,0x40,0x3F,0x20,0x1F,0x18,0x07,0x07,0x00,0x00,
  0xC0,0xC0,0xF0,0x30,0x78,0x88,0x3C,0xC4,0x5C,0xA4,0x9E,0x62,0x3E,0xC2,0x3E,0xC2,
  0x5E,0xA2,0x7E,0x82,0x0C,0xF4,0x0C,0xF4,0x98,0x68,0xB0,0x70,0xC0,0xC0,0x00,0x00,
  0x07,0x07,0x1F,0x18,0x2F,0x30,0x4F,0x70,0x6F,0x50,0x9F,0xE0,0x9F,0xE0,0xBF,0xC0,
  0xFF,0x80,0xB7,0xC8,0x63,0x5C,0x43,0x7C,0x3F,0x20,0x1F,0x18,0x07,0x07,0x00,0x00,
  0xC0,0xC0,0xB0,0x70,0x18,0xE8,0x0C,0xF4,0x0C,0xF4,0x82,0x7E,0x82,0x7E,0x86,0x7A,
  0xC6,0x3A,0xE6,0x1A,0xF4,0x0C,0xFC,0x04,0xF8,0x08,0xF0,0x30,0xC0,0xC0,0x00,0x00,

  /* Tile 0x08 */
  0x07,0x07,0x1E,0x19,0x20,0x3F,0x40,0x7F,0x42,0x7D,0x81,0xFE,0x81,0xFE,0x83,0xFC,
  0xD7,0xA8,0xBB,0xC4,0x6E,0x51,0x7C,0x43,0x3F,0x20,0x1F,0x18,0x07,0x07,0x00,0x00,
  0xC0,0xC0,0x70,0xB0,0xE8,0x18,0xF4,0x0C,0xF4,0x0C,0xFE,0x02,0xFE,0x02,0xFE,0x02,
  0xFE,0x02,0x7E,0x82,0x3C,0xC4,0x3C,0xC4,0xF8,0x08,0xF0,0x30,0xC0,0xC0,0x00,0x00,
  0x07,0x07,0x1B,0x1C,0x20,0x3F,0x40,0x7F,0x40,0x7F,0xE0,0x9F,0x90,0xEF,0x89,0xF6,
  0x8D,0xF2,0x9F,0xE0,0x5E,0x61,0x6F,0x50,0x3F,0x20,0x1F,0x18,0x07,0x07,0x00,0x00,
  0xC0,0xC0,0xB0,0x70,0x28,0xD8,0x04,0xFC,0x2C,0xD4,0x1E,0xE2,0x1E,0xE2,0x3E,0xC2,
  0x7E,0x82,0xB6,0x4A,0xE4,0x1C,0xC4,0x3C,0xF8,0x08,0xF0,0x30,0xC0,0xC0,0x00,0x00,

  /* Tile 0x10 */
  0x07,0x07,0x18,0x1F,0x20,0x3F,0x40,0x7F,0x40,0x7F,0xEE,0x91,0xF1,0x8E,0xE0,0x9F,
  0xE0,0x9F,0xF1,0x8E,0x71,0x4E,0x72,0x4D,0x3F,0x20,0x1F,0x18,0x07,0x07,0x00,0x00,
  0xC0,0xC0,0xF0,0x30,0x08,0xF8,0x04,0xFC,0x04,0xFC,0x02,0xFE,0x02,0xFE,0x92,0x6E,
  0xD6,0x2A,0xFE,0x02,0xEC,0x14,0xFC,0x04,0xF8,0x08,0xF0,0x30,0xC0,0xC0,0x00,0x00,
  0x07,0x07,0x1D,0x1A,0x36,0x29,0x5C,0x63,0x6C,0x53,0xCE,0xB1,0x9F,0xE0,0x9E,0xE1,
  0xAE,0xD1,0xBF,0xC0,0x47,0x78,0x47,0x78,0x2F,0x30,0x1F,0x18,0x07,0x07,0x00,0x00,
  0xC0,0xC0,0x70,0xB0,0x08,0xF8,0x04,0xFC,0x04,0xFC,0xE2,0x1E,0x32,0xCE,0x0E,0xF2,
  0x0E,0xF2,0x1E,0xE2,0x1C,0xE4,0x2C,0xD4,0xF8,0x08,0xF0,0x30,0xC0,0xC0,0x00,0x00,

  /* Tile 0x18 */
  0x07,0x07,0x1E,0x19,0x33,0x2C,0x49,0x76,0x42,0x7D,0xC4,0xBB,0xC1,0xBE,0xC1,0xBE,
  0xE2,0x9D,0xF3,0x8C,0x78,0x47,0x78,0x47,0x3C,0x23,0x1C,0x1B,0x07,0x07,0x00,0x00,
  0xC0,0xC0,0x70,0xB0,0x68,0x98,0xC4,0x3C,0xC4,0x3C,0xEE,0x12,0xF2,0x0E,0xE2,0x1E,
  0xE2,0x1E,0xF2,0x0E,0x7C,0x84,0x7C,0x84,0xF8,0x08,0xF0,0x30,0xC0,0xC0,0x00,0x00
};



struct SSkaterBoi
{
    UBYTE SpriteIDs[4];
    uint8_t XPos;
    uint8_t YPos;
    uint8_t RenderWidth;
    uint8_t RenderHeight;
};

void InitSkaterBoi(struct SSkaterBoi* SkaterBoiPtr)
{
    // He was a skater boi
    set_sprite_data(0, 8, SkaterSpriteData); 
	SkaterBoiPtr->XPos = 80;
	SkaterBoiPtr->YPos = 80;
	SkaterBoiPtr->RenderWidth = 16;
	SkaterBoiPtr->RenderHeight = 16;

	set_sprite_tile(0, 0);
	SkaterBoiPtr->SpriteIDs[0] = 0;
	set_sprite_tile(1, 1);
	SkaterBoiPtr->SpriteIDs[1] = 1;
	set_sprite_tile(2, 2);
	SkaterBoiPtr->SpriteIDs[2] = 2;
	set_sprite_tile(3, 3);
	SkaterBoiPtr->SpriteIDs[3] = 3;

	move_sprite(SkaterBoiPtr->SpriteIDs[0], SkaterBoiPtr->XPos, SkaterBoiPtr->YPos);
	move_sprite(SkaterBoiPtr->SpriteIDs[1], SkaterBoiPtr->XPos, SkaterBoiPtr->YPos + 8);
	move_sprite(SkaterBoiPtr->SpriteIDs[2], SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos);
	move_sprite(SkaterBoiPtr->SpriteIDs[3], SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos + 8);

    // She said see ya later boi
}