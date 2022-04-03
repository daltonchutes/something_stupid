;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _vbl_update
	.globl _main
	.globl _gbt_update
	.globl _gbt_loop
	.globl _gbt_play
	.globl _GameResetState
	.globl _GameLoadState
	.globl _GameState
	.globl _MenuLoadState
	.globl _MenuState
	.globl _SplashLoadState
	.globl _SplashState
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _joypad
	.globl _add_VBL
	.globl _vbl_count
	.globl _CurrentState
	.globl _Init
	.globl _Update
	.globl _UpdateGame
	.globl _PollInput
	.globl _OnPushUp
	.globl _OnPushDown
	.globl _OnPushLeft
	.globl _OnPushRight
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_CurrentState::
	.ds 2
_vbl_count::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
;main.c:16: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:18: Init();
	call	_Init
;main.c:19: Update();
;main.c:20: }
	jp	_Update
;main.c:22: void vbl_update() {
;	---------------------------------
; Function vbl_update
; ---------------------------------
_vbl_update::
;main.c:23: vbl_count ++;
	ld	hl, #_vbl_count
	inc	(hl)
	ret	NZ
	inc	hl
	inc	(hl)
;main.c:24: }
	ret
;main.c:26: void Init()
;	---------------------------------
; Function Init
; ---------------------------------
_Init::
;main.c:28: CurrentState = SPLASHSTATELOAD;
	ld	hl, #_CurrentState
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;C:/LudumDare50/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;main.c:32: add_VBL(vbl_update);
	ld	de, #_vbl_update
	push	de
	call	_add_VBL
	pop	hl
;main.c:34: gbt_play(song_Data, 2, 7);
	ld	hl, #0x702
	push	hl
	ld	de, #_song_Data
	push	de
	call	_gbt_play
	add	sp, #4
;main.c:35: gbt_loop(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_gbt_loop
	inc	sp
;main.c:37: set_interrupts(VBL_IFLAG);
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;C:/LudumDare50/gbdk/include/gb/gb.h:655: __asm__("ei");
	ei
;main.c:40: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:41: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:42: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:43: }
	ret
;main.c:45: void Update()
;	---------------------------------
; Function Update
; ---------------------------------
_Update::
;main.c:47: while (1)
00104$:
;main.c:49: if(vbl_count == 0){
	ld	hl, #_vbl_count + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
;main.c:50: wait_vbl_done();
	call	_wait_vbl_done
00102$:
;main.c:52: vbl_count = 0;
	xor	a, a
	ld	hl, #_vbl_count
	ld	(hl+), a
	ld	(hl), a
;main.c:55: UpdateGame();
	call	_UpdateGame
;main.c:56: gbt_update();
	call	_gbt_update
;main.c:59: }
	jr	00104$
;main.c:61: void UpdateGame()
;	---------------------------------
; Function UpdateGame
; ---------------------------------
_UpdateGame::
;main.c:63: switch(CurrentState)
	ld	hl, #_CurrentState + 1
	bit	7, (hl)
	ret	NZ
	dec	hl
	ld	a, #0x06
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00121$
	bit	7, d
	jr	NZ, 00122$
	cp	a, a
	jr	00122$
00121$:
	bit	7, d
	jr	Z, 00122$
	scf
00122$:
	ret	C
	ld	hl, #_CurrentState
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00123$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00123$:
	jp	00102$
	jp	00101$
	jp	00104$
	jp	00103$
	jp	00105$
	jp	00106$
	jp	00107$
;main.c:65: case SPLASHSTATELOAD:
00101$:
;main.c:66: CurrentState = SplashLoadState();
	call	_SplashLoadState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:67: break;
	ret
;main.c:68: case SPLASHSTATE:
00102$:
;main.c:69: CurrentState = SplashState();
	call	_SplashState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:70: break;
	ret
;main.c:71: case MENUSTATELOAD:
00103$:
;main.c:72: CurrentState = MenuLoadState();
	call	_MenuLoadState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:73: break;
	ret
;main.c:74: case MENUSTATE: // Menu State!
00104$:
;main.c:75: CurrentState = MenuState();
	call	_MenuState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:76: break;
	ret
;main.c:77: case GAMESTATE: // Game State!
00105$:
;main.c:78: CurrentState = GameState();
	call	_GameState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:79: break;
	ret
;main.c:80: case GAMESTATELOAD: // Game load State!
00106$:
;main.c:81: CurrentState = GameLoadState();
	call	_GameLoadState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:82: break;
	ret
;main.c:83: case GAMESTATERESET: // Game Reset State!
00107$:
;main.c:84: CurrentState = GameResetState();
	call	_GameResetState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:86: }
;main.c:87: }
	ret
;main.c:89: void PollInput()
;	---------------------------------
; Function PollInput
; ---------------------------------
_PollInput::
;main.c:91: switch(joypad())
	call	_joypad
	ld	a, e
	cp	a, #0x01
	jp	Z,_OnPushRight
	cp	a, #0x02
	jp	Z,_OnPushLeft
	cp	a, #0x04
	jp	Z,_OnPushUp
	sub	a, #0x08
	jp	Z,_OnPushDown
;main.c:93: case J_UP:
;main.c:94: OnPushUp();
	ret
;main.c:95: break;
;main.c:96: case J_DOWN:
;main.c:97: OnPushDown();
	ret
;main.c:98: break;
;main.c:99: case J_LEFT:
;main.c:100: OnPushLeft();
	ret
;main.c:101: break;
;main.c:102: case J_RIGHT:
;main.c:103: OnPushRight();
	ret
;main.c:107: }
;main.c:108: }
	ret
;main.c:110: void OnPushUp()
;	---------------------------------
; Function OnPushUp
; ---------------------------------
_OnPushUp::
;main.c:113: }
	ret
;main.c:115: void OnPushDown()
;	---------------------------------
; Function OnPushDown
; ---------------------------------
_OnPushDown::
;main.c:118: }
	ret
;main.c:120: void OnPushLeft()
;	---------------------------------
; Function OnPushLeft
; ---------------------------------
_OnPushLeft::
;main.c:123: }
	ret
;main.c:125: void OnPushRight()
;	---------------------------------
; Function OnPushRight
; ---------------------------------
_OnPushRight::
;main.c:128: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
