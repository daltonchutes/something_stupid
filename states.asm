;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module states
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _GameResetState
	.globl _GameLoadState
	.globl _GameState
	.globl _MenuState
	.globl _MenuLoadState
	.globl _SplashState
	.globl _SplashLoadState
	.globl _UpdateLevelNumber
	.globl _InitLevelNumber
	.globl _randomXD
	.globl _rand
	.globl _InitBalanceArrow
	.globl _SetBalanceArrowPos
	.globl _SetSkaterBoiPos
	.globl _InitSkaterBoi
	.globl _SetSpriteIndex
	.globl _puts
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _joypad
	.globl _CounterMaxLevelArray
	.globl _InfluenceCounterMaxLevelArray
	.globl _LevelProgress
	.globl _Level
	.globl _PlayerXOffset
	.globl _InfluenceCounter
	.globl _PlayerCounter
	.globl _Counter
	.globl _ManualBarInfluence
	.globl _ManualBarDar
	.globl _ManualBar
	.globl _NumbersArray
	.globl _NumbersData
	.globl _SpriteData
	.globl _BalanceArrow
	.globl _SkaterBoi
	.globl _Manual_map
	.globl _Manual_data
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_SkaterBoi::
	.ds 11
_BalanceArrow::
	.ds 8
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_SpriteData::
	.ds 368
_NumbersData::
	.ds 160
_NumbersArray::
	.ds 22
_ManualBar::
	.ds 2
_ManualBarDar::
	.ds 2
_ManualBarInfluence::
	.ds 2
_Counter::
	.ds 2
_PlayerCounter::
	.ds 2
_InfluenceCounter::
	.ds 2
_PlayerXOffset::
	.ds 2
_Level::
	.ds 2
_LevelProgress::
	.ds 2
_InfluenceCounterMaxLevelArray::
	.ds 20
_CounterMaxLevelArray::
	.ds 20
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;skater_boi.c:15: void SetSpriteIndex(struct SSkaterBoi* SkaterBoi, uint8_t Index)
;	---------------------------------
; Function SetSpriteIndex
; ---------------------------------
_SetSpriteIndex::
;skater_boi.c:17: SkaterBoi->BalanceState = Index;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x0a
	ld	c, a
	jr	NC, 00109$
	inc	b
00109$:
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;skater_boi.c:19: uint8_t Offset = 3 + ((Index) * 6);
	ld	a, (hl)
	ld	c, a
	add	a, a
	add	a, c
	add	a, a
	add	a, #0x03
	ld	c, a
;C:/LudumDare50/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;skater_boi.c:21: set_sprite_tile(4, Offset + 1);
	ld	b, c
	inc	b
;C:/LudumDare50/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), b
;skater_boi.c:22: set_sprite_tile(5, Offset + 2);
	ld	b, c
	inc	b
	inc	b
;C:/LudumDare50/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), b
;skater_boi.c:23: set_sprite_tile(6, Offset + 3);
	ld	b, c
	inc	b
	inc	b
	inc	b
;C:/LudumDare50/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 26)
	ld	(hl), b
;skater_boi.c:24: set_sprite_tile(7, Offset + 4);
	ld	b, c
	inc	b
	inc	b
	inc	b
	inc	b
;C:/LudumDare50/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 30)
	ld	(hl), b
;skater_boi.c:25: set_sprite_tile(8, Offset + 5);
	ld	a, c
	add	a, #0x05
	ld	c, a
;C:/LudumDare50/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 34)
	ld	(hl), c
;skater_boi.c:25: set_sprite_tile(8, Offset + 5);
;skater_boi.c:26: }
	ret
_Manual_data:
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0x99	; 153
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x1f	; 31
	.db #0xc0	; 192
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xd3	; 211
	.db #0x08	; 8
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x40	; 64
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0x7f	; 127
	.db #0xbe	; 190
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0xbf	; 191
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0e	; 14
	.db #0xf1	; 241
	.db #0x1f	; 31
	.db #0xee	; 238
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0x18	; 24
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xd3	; 211
	.db #0x08	; 8
	.db #0xc0	; 192
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0x03	; 3
	.db #0x08	; 8
	.db #0xe3	; 227
	.db #0x08	; 8
	.db #0xe3	; 227
	.db #0x08	; 8
	.db #0x63	; 99	'c'
	.db #0x08	; 8
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0x07	; 7
	.db #0x60	; 96
	.db #0x0f	; 15
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xf1	; 241
	.db #0x04	; 4
	.db #0xe0	; 224
	.db #0x0e	; 14
	.db #0x80	; 128
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x80	; 128
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x02	; 2
	.db #0xc2	; 194
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x02	; 2
	.db #0xc0	; 192
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0x7b	; 123
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf9	; 249
	.db #0xf6	; 246
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xe1	; 225
	.db #0x5e	; 94
	.db #0xfd	; 253
	.db #0x42	; 66	'B'
	.db #0xff	; 255
	.db #0x9d	; 157
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x7f	; 127
	.db #0xbe	; 190
	.db #0x7f	; 127
	.db #0xbe	; 190
	.db #0xfe	; 254
	.db #0x7d	; 125
	.db #0xfc	; 252
	.db #0x7b	; 123
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x23	; 35
	.db #0x88	; 136
	.db #0x03	; 3
	.db #0xc8	; 200
	.db #0x03	; 3
	.db #0xe8	; 232
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x03	; 3
	.db #0xf0	; 240
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0x0f	; 15
	.db #0x40	; 64
	.db #0x1f	; 31
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0x03	; 3
	.db #0x70	; 112	'p'
	.db #0x07	; 7
	.db #0x20	; 32
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0xe0	; 224
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x03	; 3
	.db #0xf8	; 248
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x0f	; 15
	.db #0xc0	; 192
	.db #0x1f	; 31
	.db #0x80	; 128
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0xe0	; 224
	.db #0x04	; 4
	.db #0xf1	; 241
	.db #0x00	; 0
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfd	; 253
	.db #0x07	; 7
	.db #0xfb	; 251
	.db #0x07	; 7
	.db #0xfb	; 251
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0x1e	; 30
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x7f	; 127
	.db #0xb0	; 176
	.db #0x30	; 48	'0'
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0x7b	; 123
	.db #0xff	; 255
	.db #0x7b	; 123
	.db #0xff	; 255
	.db #0x3b	; 59
	.db #0xff	; 255
	.db #0x37	; 55	'7'
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0x77	; 119	'w'
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x04	; 4
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xc1	; 193
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xf0	; 240
	.db #0x6f	; 111	'o'
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xfe	; 254
	.db #0x79	; 121	'y'
	.db #0x7f	; 127
	.db #0xbe	; 190
	.db #0x3f	; 63
	.db #0xcf	; 207
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x02	; 2
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfd	; 253
	.db #0x07	; 7
	.db #0xfb	; 251
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xf9	; 249
	.db #0xf8	; 248
	.db #0xe7	; 231
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xc0	; 192
	.db #0xbf	; 191
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xf6	; 246
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0x7d	; 125
	.db #0xfc	; 252
	.db #0x7b	; 123
	.db #0x78	; 120	'x'
	.db #0xb7	; 183
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x30	; 48	'0'
	.db #0xcf	; 207
	.db #0x7c	; 124
	.db #0xb3	; 179
	.db #0xfe	; 254
	.db #0x7d	; 125
	.db #0xfe	; 254
	.db #0x7d	; 125
	.db #0xfe	; 254
	.db #0x7d	; 125
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x62	; 98	'b'
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xc4	; 196
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0x88	; 136
	.db #0xff	; 255
	.db #0x8d	; 141
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xe1	; 225
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0xff	; 255
	.db #0x7c	; 124
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x7a	; 122	'z'
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x02	; 2
	.db #0xfe	; 254
	.db #0x1e	; 30
	.db #0xfe	; 254
	.db #0x1e	; 30
	.db #0xfe	; 254
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdb	; 219
	.db #0x1b	; 27
	.db #0xe5	; 229
	.db #0x13	; 19
	.db #0xed	; 237
	.db #0x13	; 19
	.db #0xed	; 237
	.db #0x11	; 17
	.db #0xee	; 238
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x90	; 144
	.db #0x6f	; 111	'o'
	.db #0xb8	; 184
	.db #0x57	; 87	'W'
	.db #0xfc	; 252
	.db #0xbb	; 187
	.db #0xfc	; 252
	.db #0xbb	; 187
	.db #0xff	; 255
	.db #0xbc	; 188
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0xf7	; 247
	.db #0x6b	; 107	'k'
	.db #0x78	; 120	'x'
	.db #0x87	; 135
	.db #0xfc	; 252
	.db #0x7b	; 123
	.db #0xfe	; 254
	.db #0x7d	; 125
	.db #0xfe	; 254
	.db #0x7d	; 125
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xfc	; 252
	.db #0xfb	; 251
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0x1f	; 31
	.db #0xee	; 238
	.db #0x1f	; 31
	.db #0xee	; 238
	.db #0x1f	; 31
	.db #0xef	; 239
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x3f	; 63
	.db #0xdf	; 223
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x38	; 56	'8'
	.db #0xd7	; 215
	.db #0x39	; 57	'9'
	.db #0xd6	; 214
	.db #0xff	; 255
	.db #0x31	; 49	'1'
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x86	; 134
	.db #0x79	; 121	'y'
	.db #0xcf	; 207
	.db #0xb6	; 182
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xef	; 239
	.db #0xd7	; 215
	.db #0xef	; 239
	.db #0xd7	; 215
	.db #0xe7	; 231
	.db #0xdb	; 219
	.db #0xc7	; 199
	.db #0xbb	; 187
	.db #0xfc	; 252
	.db #0x7b	; 123
	.db #0xf8	; 248
	.db #0x77	; 119	'w'
	.db #0xf8	; 248
	.db #0x77	; 119	'w'
	.db #0xf8	; 248
	.db #0x77	; 119	'w'
	.db #0xfc	; 252
	.db #0xbb	; 187
	.db #0xfe	; 254
	.db #0xbd	; 189
	.db #0xfc	; 252
	.db #0x7b	; 123
	.db #0xfc	; 252
	.db #0x7b	; 123
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x63	; 99	'c'
	.db #0x7f	; 127
	.db #0x62	; 98	'b'
	.db #0x7f	; 127
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x62	; 98	'b'
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x76	; 118	'v'
	.db #0x2b	; 43
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0x44	; 68	'D'
	.db #0xff	; 255
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xd6	; 214
	.db #0xab	; 171
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x78	; 120	'x'
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xab	; 171
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x76	; 118	'v'
	.db #0xff	; 255
	.db #0x6e	; 110	'n'
	.db #0xff	; 255
	.db #0x6f	; 111	'o'
	.db #0xff	; 255
	.db #0x6e	; 110	'n'
	.db #0xff	; 255
	.db #0x7d	; 125
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0x5e	; 94
	.db #0xff	; 255
	.db #0xbe	; 190
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x63	; 99	'c'
	.db #0x9d	; 157
	.db #0x0f	; 15
	.db #0xf3	; 243
	.db #0x3f	; 63
	.db #0xcf	; 207
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbc	; 188
	.db #0x3c	; 60
	.db #0xc3	; 195
	.db #0x30	; 48	'0'
	.db #0xcf	; 207
	.db #0x30	; 48	'0'
	.db #0xcf	; 207
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xc0	; 192
	.db #0xbf	; 191
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0x7d	; 125
	.db #0xfc	; 252
	.db #0x7b	; 123
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0x3d	; 61
	.db #0xbf	; 191
	.db #0x5e	; 94
	.db #0xbf	; 191
	.db #0x5e	; 94
	.db #0x3f	; 63
	.db #0xde	; 222
	.db #0x3f	; 63
	.db #0xde	; 222
	.db #0x1e	; 30
	.db #0xed	; 237
	.db #0xc7	; 199
	.db #0xbb	; 187
	.db #0xef	; 239
	.db #0x97	; 151
	.db #0xff	; 255
	.db #0xee	; 238
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0x62	; 98	'b'
	.db #0x6c	; 108	'l'
	.db #0x93	; 147
	.db #0xf8	; 248
	.db #0x67	; 103	'g'
	.db #0xe0	; 224
	.db #0x5f	; 95
	.db #0xe0	; 224
	.db #0xdf	; 223
	.db #0xf0	; 240
	.db #0xef	; 239
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0xf7	; 247
	.db #0xf8	; 248
	.db #0x37	; 55	'7'
	.db #0x30	; 48	'0'
	.db #0xcf	; 207
	.db #0x6a	; 106	'j'
	.db #0x55	; 85	'U'
	.db #0x76	; 118	'v'
	.db #0x2b	; 43
	.db #0x6a	; 106	'j'
	.db #0x55	; 85	'U'
	.db #0x76	; 118	'v'
	.db #0x2b	; 43
	.db #0x6a	; 106	'j'
	.db #0x55	; 85	'U'
	.db #0x76	; 118	'v'
	.db #0x2b	; 43
	.db #0x6a	; 106	'j'
	.db #0x55	; 85	'U'
	.db #0x76	; 118	'v'
	.db #0x2b	; 43
	.db #0xee	; 238
	.db #0x55	; 85	'U'
	.db #0xd6	; 214
	.db #0xab	; 171
	.db #0xee	; 238
	.db #0x55	; 85	'U'
	.db #0xd6	; 214
	.db #0xab	; 171
	.db #0xee	; 238
	.db #0x55	; 85	'U'
	.db #0xd6	; 214
	.db #0xab	; 171
	.db #0xee	; 238
	.db #0x55	; 85	'U'
	.db #0xd6	; 214
	.db #0xab	; 171
	.db #0xfe	; 254
	.db #0x55	; 85	'U'
	.db #0xfc	; 252
	.db #0xab	; 171
	.db #0xfe	; 254
	.db #0x55	; 85	'U'
	.db #0xfc	; 252
	.db #0xab	; 171
	.db #0xfe	; 254
	.db #0x55	; 85	'U'
	.db #0xfc	; 252
	.db #0xab	; 171
	.db #0xfe	; 254
	.db #0x55	; 85	'U'
	.db #0xfc	; 252
	.db #0xab	; 171
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8d	; 141
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0x63	; 99	'c'
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x20	; 32
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0x19	; 25
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x60	; 96
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x20	; 32
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0xdf	; 223
	.db #0x20	; 32
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x27	; 39
	.db #0xdf	; 223
	.db #0x27	; 39
	.db #0xdf	; 223
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0x7b	; 123
	.db #0xfc	; 252
	.db #0x3b	; 59
	.db #0xfc	; 252
	.db #0x3b	; 59
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xf3	; 243
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x0c	; 12
	.db #0xf3	; 243
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x08	; 8
	.db #0xf7	; 247
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x43	; 67	'C'
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xc2	; 194
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x27	; 39
	.db #0xdf	; 223
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x11	; 17
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xbb	; 187
	.db #0x0c	; 12
	.db #0xfb	; 251
	.db #0x1f	; 31
	.db #0xfd	; 253
	.db #0x02	; 2
	.db #0xfd	; 253
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0x87	; 135
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xff	; 255
	.db #0x27	; 39
	.db #0xdf	; 223
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0xfc	; 252
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0x78	; 120	'x'
	.db #0x07	; 7
	.db #0x38	; 56	'8'
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0xf7	; 247
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x87	; 135
	.db #0x07	; 7
	.db #0xe3	; 227
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0xc7	; 199
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x7f	; 127
	.db #0xc0	; 192
	.db #0x3f	; 63
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
_Manual_map:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x0a	; 10
	.db #0x03	; 3
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x2d	; 45
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x2e	; 46
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x03	; 3
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x36	; 54	'6'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x37	; 55	'7'
	.db #0x03	; 3
	.db #0x2e	; 46
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x03	; 3
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x4a	; 74	'J'
	.db #0x4b	; 75	'K'
	.db #0x4c	; 76	'L'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x50	; 80	'P'
	.db #0x51	; 81	'Q'
	.db #0x52	; 82	'R'
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x58	; 88	'X'
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x5e	; 94
	.db #0x5f	; 95
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x03	; 3
	.db #0x6c	; 108	'l'
	.db #0x6d	; 109	'm'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x03	; 3
	.db #0x71	; 113	'q'
	.db #0x72	; 114	'r'
	.db #0x72	; 114	'r'
	.db #0x72	; 114	'r'
	.db #0x72	; 114	'r'
	.db #0x72	; 114	'r'
	.db #0x72	; 114	'r'
	.db #0x72	; 114	'r'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x03	; 3
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x76	; 118	'v'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x77	; 119	'w'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x78	; 120	'x'
	.db #0x79	; 121	'y'
	.db #0x75	; 117	'u'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0x75	; 117	'u'
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x7a	; 122	'z'
	.db #0x05	; 5
	.db #0x7e	; 126
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x05	; 5
	.db #0x86	; 134
	.db #0x03	; 3
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x89	; 137
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0x8a	; 138
	.db #0x8b	; 139
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x8c	; 140
	.db #0x8d	; 141
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x8e	; 142
	.db #0x90	; 144
;skater_boi.c:28: void InitSkaterBoi(struct SSkaterBoi* SkaterBoiPtr)
;	---------------------------------
; Function InitSkaterBoi
; ---------------------------------
_InitSkaterBoi::
	add	sp, #-6
;skater_boi.c:31: SkaterBoiPtr->XPos = 80;
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	(hl), #0x50
;skater_boi.c:32: SkaterBoiPtr->YPos = 101;
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x65
;skater_boi.c:33: SkaterBoiPtr->RenderWidth = 16;
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x10
;skater_boi.c:34: SkaterBoiPtr->RenderHeight = 16;
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x10
;skater_boi.c:36: SkaterBoiPtr->SpriteIDs[0] = 3;
	pop	hl
	push	hl
	ld	(hl), #0x03
;skater_boi.c:37: SkaterBoiPtr->SpriteIDs[1] = 4;
	pop	de
	push	de
	inc	de
	ld	a, #0x04
	ld	(de), a
;skater_boi.c:38: SkaterBoiPtr->SpriteIDs[2] = 5;
	pop	de
	push	de
	inc	de
	inc	de
	ld	a, #0x05
	ld	(de), a
;skater_boi.c:39: SkaterBoiPtr->SpriteIDs[3] = 6;
	pop	de
	push	de
	inc	de
	inc	de
	inc	de
	ld	a, #0x06
	ld	(de), a
;skater_boi.c:40: SkaterBoiPtr->SpriteIDs[4] = 7;
	pop	de
	push	de
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x07
;skater_boi.c:41: SkaterBoiPtr->SpriteIDs[5] = 8;
	pop	de
	push	de
	ld	hl, #0x0005
	add	hl, de
	ld	(hl), #0x08
;skater_boi.c:43: move_sprite(3, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	ld	a, (bc)
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	de, #_shadow_OAM+12
	ld	a, (hl+)
	ld	(de), a
	inc	de
;skater_boi.c:44: move_sprite(4, SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos);
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	ld	a, (bc)
	add	a, #0x08
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	de, #_shadow_OAM+16
	ld	a, (hl+)
	ld	(de), a
	inc	de
;skater_boi.c:45: move_sprite(5, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos + 8);
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	d, a
	ld	a, (bc)
	ld	e, a
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;skater_boi.c:46: move_sprite(6, SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos + 8);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ld	d, a
	ld	a, (bc)
	add	a, #0x08
	ld	e, a
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;skater_boi.c:47: move_sprite(7, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos + 16);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x10
	ld	d, a
	ld	a, (bc)
	ld	e, a
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 28)
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;skater_boi.c:48: move_sprite(8, SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos + 16);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x10
	ld	e, a
	ld	a, (bc)
	add	a, #0x08
	ld	c, a
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 32)
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;skater_boi.c:50: SetSpriteIndex(SkaterBoiPtr, 1);
	ld	a, #0x01
	push	af
	inc	sp
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_SetSpriteIndex
;skater_boi.c:52: }
	add	sp, #9
	ret
;skater_boi.c:54: void SetSkaterBoiPos (struct SSkaterBoi* SkaterBoiPtr, uint8_t NewX, uint8_t NewY)
;	---------------------------------
; Function SetSkaterBoiPos
; ---------------------------------
_SetSkaterBoiPos::
	add	sp, #-4
;skater_boi.c:56: if( NewX != SkaterBoiPtr->XPos)
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, c
	jr	Z, 00109$
;skater_boi.c:58: SkaterBoiPtr->XPos = NewX;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#8
	ld	a, (hl)
	ld	(de), a
;skater_boi.c:59: SkaterBoiPtr->YPos = NewY;
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(bc), a
;skater_boi.c:61: move_sprite(3, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos);
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#1
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	de, #(_shadow_OAM + 12)
	ld	a, (hl+)
	ld	(de), a
	ld	de, #(_shadow_OAM + 13)
	ld	a, (hl)
	ld	(de), a
;skater_boi.c:62: move_sprite(4, SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos);
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ld	a, (hl-)
	add	a, #0x08
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #(_shadow_OAM + 16)
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;skater_boi.c:63: move_sprite(5, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos + 8);
	ldhl	sp,	#0
	ld	c, (hl)
	ld	a, c
	add	a, #0x08
	ld	b, a
	ld	e, b
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl), e
	ld	de, #(_shadow_OAM + 21)
	ldhl	sp,	#1
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, (hl+)
	ld	(de), a
	ld	de, #_shadow_OAM+24
	ld	a, b
	ld	(de), a
	inc	de
;skater_boi.c:65: move_sprite(7, SkaterBoiPtr->XPos, SkaterBoiPtr->YPos + 16);
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, (hl-)
	ld	(de), a
	ld	a, c
	add	a, #0x10
	ld	e, a
	ld	bc, #_shadow_OAM+28
	ld	(bc), a
	inc	bc
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, (hl+)
	ld	(bc), a
	ld	bc, #_shadow_OAM+32
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;skater_boi.c:66: move_sprite(8, SkaterBoiPtr->XPos + 8, SkaterBoiPtr->YPos + 16);
00109$:
;skater_boi.c:68: }
	add	sp, #4
	ret
;balance_arrow.c:17: void SetBalanceArrowPos(struct SBalanceArrow* BalanceArrow, uint8_t NewX, uint8_t NewY)
;	---------------------------------
; Function SetBalanceArrowPos
; ---------------------------------
_SetBalanceArrowPos::
	dec	sp
	dec	sp
;balance_arrow.c:19: BalanceArrow->XRenderPos = NewX;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;balance_arrow.c:20: BalanceArrow->YRenderPos = NewY;
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(bc), a
;balance_arrow.c:23: move_sprite(BalanceArrow->SpriteIDs[0], BalanceArrow->XRenderPos, BalanceArrow->YRenderPos);
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (de)
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl-)
	ld	(bc), a
	inc	bc
;balance_arrow.c:24: move_sprite(BalanceArrow->SpriteIDs[1], BalanceArrow->XRenderPos, BalanceArrow->YRenderPos + 8);
	ld	a, (hl+)
	ld	(bc), a
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
;balance_arrow.c:25: move_sprite(BalanceArrow->SpriteIDs[2], BalanceArrow->XRenderPos, BalanceArrow->YRenderPos + 16);
	ld	a, (hl+)
	ld	(bc), a
	ld	a, (hl)
	add	a, #0x10
	ld	c, a
	inc	de
	inc	de
	ld	a, (de)
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;balance_arrow.c:25: move_sprite(BalanceArrow->SpriteIDs[2], BalanceArrow->XRenderPos, BalanceArrow->YRenderPos + 16);
;balance_arrow.c:26: }
	inc	sp
	inc	sp
	ret
;balance_arrow.c:28: void InitBalanceArrow(struct SBalanceArrow* BalanceArrow)
;	---------------------------------
; Function InitBalanceArrow
; ---------------------------------
_InitBalanceArrow::
;balance_arrow.c:31: BalanceArrow->RenderWidth = 16;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x10
;balance_arrow.c:32: BalanceArrow->RenderHeight = 16;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x10
;C:/LudumDare50/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;balance_arrow.c:35: BalanceArrow->SpriteIDs[0] = 0;
	xor	a, a
	ld	(bc), a
;C:/LudumDare50/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
;balance_arrow.c:38: BalanceArrow->SpriteIDs[1] = 1;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x01
;C:/LudumDare50/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
;balance_arrow.c:41: BalanceArrow->SpriteIDs[2] = 2;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x02
;balance_arrow.c:43: SetBalanceArrowPos(BalanceArrow, ARROW_CENTER, 125);    
	ld	hl, #0x7d54
	push	hl
	push	bc
	call	_SetBalanceArrowPos
	add	sp, #4
;balance_arrow.c:45: BalanceArrow->CurrentOffset = ARROW_CENTER;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x54
;balance_arrow.c:46: }
	ret
;random.c:5: bool randomXD()
;	---------------------------------
; Function randomXD
; ---------------------------------
_randomXD::
;random.c:7: return rand() > 127;
	call	_rand
	ld	a, #0x7f
	sub	a, e
	ld	a, #0x00
	rla
	ld	e, a
;random.c:8: }
	ret
;numbers.c:9: void InitLevelNumber(){
;	---------------------------------
; Function InitLevelNumber
; ---------------------------------
_InitLevelNumber::
;numbers.c:10: set_sprite_tile(9,NumbersArray[0]);
	ld	hl, #_NumbersArray
	ld	c, (hl)
;C:/LudumDare50/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), c
;C:/LudumDare50/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 36)
;C:/LudumDare50/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, #0x10
	ld	(hl+), a
	ld	(hl), #0x08
;numbers.c:11: move_sprite(9, 8, 16);
;numbers.c:12: }
	ret
;numbers.c:14: void UpdateLevelNumber(int Level){
;	---------------------------------
; Function UpdateLevelNumber
; ---------------------------------
_UpdateLevelNumber::
;numbers.c:15: set_sprite_tile(9, NumbersArray[Level]);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_NumbersArray
	add	hl, bc
	ld	c, (hl)
;C:/LudumDare50/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 38)
	ld	(hl), c
;numbers.c:15: set_sprite_tile(9, NumbersArray[Level]);
;numbers.c:16: }
	ret
;states.c:49: int SplashLoadState()
;	---------------------------------
; Function SplashLoadState
; ---------------------------------
_SplashLoadState::
;states.c:51: puts("Loading splash");
	ld	de, #___str_0
	push	de
	call	_puts
	pop	hl
;states.c:52: return SPLASHSTATE;    
	ld	de, #0x0000
;states.c:53: }
	ret
___str_0:
	.ascii "Loading splash"
	.db 0x00
;states.c:55: int SplashState()
;	---------------------------------
; Function SplashState
; ---------------------------------
_SplashState::
;states.c:57: puts("In splash");
	ld	de, #___str_1
	push	de
	call	_puts
	pop	hl
;states.c:58: return MENUSTATELOAD;
	ld	de, #0x0003
;states.c:59: }
	ret
___str_1:
	.ascii "In splash"
	.db 0x00
;states.c:61: int MenuLoadState()
;	---------------------------------
; Function MenuLoadState
; ---------------------------------
_MenuLoadState::
;states.c:63: puts("Loading main menu");
	ld	de, #___str_2
	push	de
	call	_puts
	pop	hl
;states.c:64: return MENUSTATE;
	ld	de, #0x0002
;states.c:65: }
	ret
___str_2:
	.ascii "Loading main menu"
	.db 0x00
;states.c:67: int MenuState() // State 0 
;	---------------------------------
; Function MenuState
; ---------------------------------
_MenuState::
;states.c:69: puts("Main Menu!");
	ld	de, #___str_3
	push	de
	call	_puts
	pop	hl
;states.c:70: return GAMESTATELOAD;
	ld	de, #0x0005
;states.c:71: }
	ret
___str_3:
	.ascii "Main Menu!"
	.db 0x00
;states.c:73: int GameState() // State 1 
;	---------------------------------
; Function GameState
; ---------------------------------
_GameState::
;states.c:75: Counter++;
	ld	hl, #_Counter
	inc	(hl)
	jr	NZ, 00230$
	inc	hl
	inc	(hl)
00230$:
;states.c:76: if(Counter > CounterMaxLevelArray[Level]){
	ld	hl, #_Level
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_CounterMaxLevelArray
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_Counter
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00232$
	bit	7, d
	jr	NZ, 00233$
	cp	a, a
	jr	00233$
00232$:
	bit	7, d
	jr	Z, 00233$
	scf
00233$:
	jp	NC, 00117$
;states.c:78: switch(joypad()){
	call	_joypad
	ld	a, e
;states.c:86: ManualBarInfluence += 1;
	ld	hl, #_ManualBarInfluence
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	bc
;states.c:78: switch(joypad()){
	cp	a, #0x01
	jr	Z, 00103$
;states.c:80: ManualBarInfluence -= 1;
	dec	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	de
;states.c:78: switch(joypad()){
	cp	a, #0x02
	jr	Z, 00101$
	cp	a, #0x10
	jr	Z, 00104$
	sub	a, #0x20
	jr	Z, 00102$
	jr	00105$
;states.c:79: case J_LEFT: 
00101$:
;states.c:80: ManualBarInfluence -= 1;
	ld	hl, #_ManualBarInfluence
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;states.c:81: break;
	jr	00105$
;states.c:82: case J_B: 
00102$:
;states.c:83: ManualBarInfluence -= 1;
	ld	hl, #_ManualBarInfluence
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;states.c:84: break;
	jr	00105$
;states.c:85: case J_RIGHT: 
00103$:
;states.c:86: ManualBarInfluence += 1;
	ld	hl, #_ManualBarInfluence
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;states.c:87: break;
	jr	00105$
;states.c:88: case J_A: 
00104$:
;states.c:89: ManualBarInfluence += 1;
	ld	hl, #_ManualBarInfluence
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;states.c:91: }
00105$:
;states.c:93: ManualBar += ManualBarInfluence; // Increment the manual bar 
	ld	a, (#_ManualBar)
	ld	hl, #_ManualBarInfluence
	add	a, (hl)
	ld	hl, #_ManualBar
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_ManualBarInfluence + 1
	adc	a, (hl)
	ld	hl, #_ManualBar + 1
;states.c:96: if(ManualBar > 157){
	ld	(hl-), a
	ld	a, #0x9d
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00238$
	bit	7, d
	jr	NZ, 00239$
	cp	a, a
	jr	00239$
00238$:
	bit	7, d
	jr	Z, 00239$
	scf
00239$:
	jr	NC, 00107$
;states.c:97: return GAMESTATERESET;
	ld	de, #0x0006
	ret
00107$:
;states.c:100: if (ManualBar > 104)
	ld	hl, #_ManualBar
	ld	a, #0x68
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00240$
	bit	7, d
	jr	NZ, 00241$
	cp	a, a
	jr	00241$
00240$:
	bit	7, d
	jr	Z, 00241$
	scf
00241$:
	jr	NC, 00112$
;states.c:102: SetSpriteIndex(&SkaterBoi, 2);
	ld	a, #0x02
	push	af
	inc	sp
	ld	de, #_SkaterBoi
	push	de
	call	_SetSpriteIndex
	add	sp, #3
	jr	00113$
00112$:
;states.c:104: else if (ManualBar > 56)
	ld	hl, #_ManualBar
	ld	a, #0x38
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00242$
	bit	7, d
	jr	NZ, 00243$
	cp	a, a
	jr	00243$
00242$:
	bit	7, d
	jr	Z, 00243$
	scf
00243$:
	jr	NC, 00109$
;states.c:106: SetSpriteIndex(&SkaterBoi, 1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	de, #_SkaterBoi
	push	de
	call	_SetSpriteIndex
	add	sp, #3
	jr	00113$
00109$:
;states.c:110: SetSpriteIndex(&SkaterBoi, 0);
	xor	a, a
	push	af
	inc	sp
	ld	de, #_SkaterBoi
	push	de
	call	_SetSpriteIndex
	add	sp, #3
00113$:
;states.c:114: if(ManualBar < 11){
	ld	hl, #_ManualBar
	ld	a, (hl+)
	sub	a, #0x0b
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00244$
	bit	7, d
	jr	NZ, 00245$
	cp	a, a
	jr	00245$
00244$:
	bit	7, d
	jr	Z, 00245$
	scf
00245$:
	jr	NC, 00115$
;states.c:115: return GAMESTATERESET;
	ld	de, #0x0006
	ret
00115$:
;states.c:118: Counter = 0;
	xor	a, a
	ld	hl, #_Counter
	ld	(hl+), a
	ld	(hl), a
00117$:
;states.c:121: PlayerCounter++;
	ld	hl, #_PlayerCounter
	inc	(hl)
	jr	NZ, 00246$
	inc	hl
	inc	(hl)
00246$:
;states.c:122: if(PlayerCounter > PLAYERCOUNTERMAX)
	ld	hl, #_PlayerCounter
	ld	a, #0xc8
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00247$
	bit	7, d
	jr	NZ, 00248$
	cp	a, a
	jr	00248$
00247$:
	bit	7, d
	jr	Z, 00248$
	scf
00248$:
	jp	NC, 00128$
;states.c:124: if (ManualBar > 124)
	ld	hl, #_ManualBar
	ld	a, #0x7c
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00249$
	bit	7, d
	jr	NZ, 00250$
	cp	a, a
	jr	00250$
00249$:
	bit	7, d
	jr	Z, 00250$
	scf
00250$:
	jr	NC, 00125$
;states.c:126: PlayerXOffset++;
	ld	hl, #_PlayerXOffset
	inc	(hl)
	jr	NZ, 00251$
	inc	hl
	inc	(hl)
00251$:
;states.c:127: if(PlayerXOffset > 10)
	ld	hl, #_PlayerXOffset
	ld	a, #0x0a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00252$
	bit	7, d
	jr	NZ, 00253$
	cp	a, a
	jr	00253$
00252$:
	bit	7, d
	jr	Z, 00253$
	scf
00253$:
	jr	NC, 00126$
;states.c:129: PlayerXOffset = 10;
	ld	hl, #_PlayerXOffset
	ld	a, #0x0a
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
	jr	00126$
00125$:
;states.c:132: else if (ManualBar <= 36)
	ld	hl, #_ManualBar
	ld	a, #0x24
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00254$
	bit	7, d
	jr	NZ, 00255$
	cp	a, a
	jr	00255$
00254$:
	bit	7, d
	jr	Z, 00255$
	scf
00255$:
	jr	C, 00126$
;states.c:134: PlayerXOffset--;
	ld	hl, #_PlayerXOffset
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
;states.c:135: if(PlayerXOffset < -10)
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0xf6
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00256$
	bit	7, d
	jr	NZ, 00257$
	cp	a, a
	jr	00257$
00256$:
	bit	7, d
	jr	Z, 00257$
	scf
00257$:
	jr	NC, 00126$
;states.c:137: PlayerXOffset = -10;
	ld	hl, #_PlayerXOffset
	ld	a, #0xf6
	ld	(hl+), a
	ld	(hl), #0xff
00126$:
;states.c:140: PlayerCounter = 0 ;   
	xor	a, a
	ld	hl, #_PlayerCounter
	ld	(hl+), a
	ld	(hl), a
00128$:
;states.c:143: InfluenceCounter++;
	ld	hl, #_InfluenceCounter
	inc	(hl)
	jr	NZ, 00258$
	inc	hl
	inc	(hl)
00258$:
;states.c:144: if(InfluenceCounter > InfluenceCounterMaxLevelArray[Level])
	ld	hl, #_Level
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	ld	hl, #_InfluenceCounterMaxLevelArray
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_InfluenceCounter
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00260$
	bit	7, d
	jr	NZ, 00261$
	cp	a, a
	jr	00261$
00260$:
	bit	7, d
	jr	Z, 00261$
	scf
00261$:
	jp	NC, 00137$
;states.c:146: if(randomXD() == true)
	call	_randomXD
	bit	0, e
	jr	Z, 00130$
;states.c:148: ManualBarInfluence++; 
	ld	hl, #_ManualBarInfluence
	inc	(hl)
	jr	NZ, 00131$
	inc	hl
	inc	(hl)
	jr	00131$
00130$:
;states.c:152: ManualBarInfluence--; 
	ld	hl, #_ManualBarInfluence
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
00131$:
;states.c:154: InfluenceCounter = 0;
	xor	a, a
	ld	hl, #_InfluenceCounter
	ld	(hl+), a
	ld	(hl), a
;states.c:155: LevelProgress++;
	ld	hl, #_LevelProgress
	inc	(hl)
	jr	NZ, 00263$
	inc	hl
	inc	(hl)
00263$:
;states.c:156: if(LevelProgress >= 50)
	ld	hl, #_LevelProgress
	ld	a, (hl+)
	sub	a, #0x32
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00264$
	bit	7, d
	jr	NZ, 00265$
	cp	a, a
	jr	00265$
00264$:
	bit	7, d
	jr	Z, 00265$
	scf
00265$:
	jr	C, 00137$
;states.c:158: Level++; 
	ld	hl, #_Level
	inc	(hl)
	jr	NZ, 00266$
	inc	hl
	inc	(hl)
00266$:
;states.c:159: UpdateLevelNumber(Level);
	ld	hl, #_Level
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_UpdateLevelNumber
	pop	hl
;states.c:160: LevelProgress = 0;
	xor	a, a
	ld	hl, #_LevelProgress
	ld	(hl+), a
	ld	(hl), a
;states.c:161: if(Level >= 9){
	ld	hl, #_Level
	ld	a, (hl+)
	sub	a, #0x09
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00267$
	bit	7, d
	jr	NZ, 00268$
	cp	a, a
	jr	00268$
00267$:
	bit	7, d
	jr	Z, 00268$
	scf
00268$:
	jr	C, 00137$
;states.c:162: Level = 9;
	ld	hl, #_Level
	ld	a, #0x09
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00137$:
;states.c:168: SetSkaterBoiPos(&SkaterBoi, SKATERCENTER+PlayerXOffset, 101); // 70 - 90 
	ld	a, (#_PlayerXOffset)
	add	a, #0x50
	ld	b, a
	ld	a, #0x65
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	de, #_SkaterBoi
	push	de
	call	_SetSkaterBoiPos
	add	sp, #4
;states.c:169: SetBalanceArrowPos(&BalanceArrow, ManualBar, 125); // 11 - 157
	ld	hl, #_ManualBar
	ld	b, (hl)
	ld	a, #0x7d
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	de, #_BalanceArrow
	push	de
	call	_SetBalanceArrowPos
	add	sp, #4
;states.c:170: return GAMESTATE;
	ld	de, #0x0004
;states.c:171: }
	ret
;states.c:173: int GameLoadState() // State 2 
;	---------------------------------
; Function GameLoadState
; ---------------------------------
_GameLoadState::
;states.c:175: set_bkg_data(0, 145, Manual_data);
	ld	de, #_Manual_data
	push	de
	ld	hl, #0x9100
	push	hl
	call	_set_bkg_data
	add	sp, #4
;states.c:176: set_bkg_tiles(0, 0, 20, 18, Manual_map);
	ld	de, #_Manual_map
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;states.c:178: set_sprite_data(0, 21, SpriteData);
	ld	de, #_SpriteData
	push	de
	ld	hl, #0x1500
	push	hl
	call	_set_sprite_data
	add	sp, #4
;states.c:179: set_sprite_data(21, 10, NumbersData);
	ld	de, #_NumbersData
	push	de
	ld	hl, #0xa15
	push	hl
	call	_set_sprite_data
	add	sp, #4
;states.c:180: InitSkaterBoi(&SkaterBoi);
	ld	de, #_SkaterBoi
	push	de
	call	_InitSkaterBoi
	pop	hl
;states.c:181: InitBalanceArrow(&BalanceArrow);
	ld	de, #_BalanceArrow
	push	de
	call	_InitBalanceArrow
	pop	hl
;states.c:182: InitLevelNumber();
	call	_InitLevelNumber
;states.c:184: UpdateLevelNumber(Level);
	ld	hl, #_Level
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_UpdateLevelNumber
	pop	hl
;states.c:186: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;states.c:187: return GAMESTATE;
	ld	de, #0x0004
;states.c:188: }
	ret
;states.c:190: int GameResetState() // State 3  
;	---------------------------------
; Function GameResetState
; ---------------------------------
_GameResetState::
;states.c:192: ManualBar = 88;
	ld	hl, #_ManualBar
	ld	a, #0x58
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;states.c:193: ManualBarDar = -1;
	ld	hl, #_ManualBarDar
	ld	a, #0xff
	ld	(hl+), a
	ld	(hl), #0xff
;states.c:194: ManualBarInfluence = 1;
	ld	hl, #_ManualBarInfluence
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;states.c:195: Counter = 0;
	xor	a, a
	ld	hl, #_Counter
	ld	(hl+), a
	ld	(hl), a
;states.c:196: PlayerCounter = 0; 
	xor	a, a
	ld	hl, #_PlayerCounter
	ld	(hl+), a
	ld	(hl), a
;states.c:197: InfluenceCounter = 0;
	xor	a, a
	ld	hl, #_InfluenceCounter
	ld	(hl+), a
	ld	(hl), a
;states.c:198: PlayerXOffset = 0;
	xor	a, a
	ld	hl, #_PlayerXOffset
	ld	(hl+), a
	ld	(hl), a
;states.c:199: Level = 1;
	ld	hl, #_Level
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;states.c:200: LevelProgress = 0;
	xor	a, a
	ld	hl, #_LevelProgress
	ld	(hl+), a
	ld	(hl), a
;states.c:201: return GAMESTATELOAD;
	ld	de, #0x0005
;states.c:202: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__SpriteData:
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x13	; 19
	.db #0x13	; 19
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x12	; 18
	.db #0x12	; 18
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x22	; 34
	.db #0x22	; 34
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x90	; 144
	.db #0x9c	; 156
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x23	; 35
	.db #0x23	; 35
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__NumbersData:
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xd8	; 216
	.db #0xd8	; 216
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0x98	; 152
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x9c	; 156
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__NumbersArray:
	.dw #0x0015
	.dw #0x0016
	.dw #0x0017
	.dw #0x0018
	.dw #0x0019
	.dw #0x001a
	.dw #0x001b
	.dw #0x001c
	.dw #0x001d
	.dw #0x001e
	.dw #0x001f
__xinit__ManualBar:
	.dw #0x0058
__xinit__ManualBarDar:
	.dw #0xffff
__xinit__ManualBarInfluence:
	.dw #0x0001
__xinit__Counter:
	.dw #0x0000
__xinit__PlayerCounter:
	.dw #0x0000
__xinit__InfluenceCounter:
	.dw #0x0000
__xinit__PlayerXOffset:
	.dw #0x0000
__xinit__Level:
	.dw #0x0001
__xinit__LevelProgress:
	.dw #0x0000
__xinit__InfluenceCounterMaxLevelArray:
	.dw #0x03e8
	.dw #0x0320
	.dw #0x0258
	.dw #0x01f4
	.dw #0x0190
	.dw #0x012c
	.dw #0x00c8
	.dw #0x0064
	.dw #0x0032
	.dw #0x0019
__xinit__CounterMaxLevelArray:
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.dw #0x0001
	.area _CABS (ABS)