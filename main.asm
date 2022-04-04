;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _gbt_update
	.globl _GameFailState
	.globl _GameResetState
	.globl _GameLoadState
	.globl _GameState
	.globl _MenuLoadState
	.globl _MenuState
	.globl _SplashLoadState
	.globl _SplashState
	.globl _wait_vbl_done
	.globl _vbl_count
	.globl _CurrentState
	.globl _vbl_update
	.globl _Init
	.globl _Update
	.globl _UpdateGame
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
;main.c:15: void vbl_update() {
;	---------------------------------
; Function vbl_update
; ---------------------------------
_vbl_update::
;main.c:16: vbl_count ++;
	ld	hl, #_vbl_count
	inc	(hl)
	ret	NZ
	inc	hl
	inc	(hl)
;main.c:17: }
	ret
;main.c:19: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:21: Init();
	call	_Init
;main.c:22: Update();
;main.c:23: }
	jp	_Update
;main.c:25: void Init()
;	---------------------------------
; Function Init
; ---------------------------------
_Init::
;main.c:28: CurrentState = MENUSTATELOAD;
	ld	hl, #_CurrentState
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;main.c:29: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:30: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:31: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:32: }
	ret
;main.c:34: void Update()
;	---------------------------------
; Function Update
; ---------------------------------
_Update::
;main.c:36: while (1)
00104$:
;main.c:38: if(vbl_count == 0){
	ld	hl, #_vbl_count + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
;main.c:39: wait_vbl_done();
	call	_wait_vbl_done
00102$:
;main.c:41: vbl_count = 0;
	xor	a, a
	ld	hl, #_vbl_count
	ld	(hl+), a
	ld	(hl), a
;main.c:44: UpdateGame();
	call	_UpdateGame
;main.c:45: gbt_update();
	call	_gbt_update
;main.c:48: }
	jr	00104$
;main.c:50: void UpdateGame()
;	---------------------------------
; Function UpdateGame
; ---------------------------------
_UpdateGame::
;main.c:52: switch(CurrentState)
	ld	hl, #_CurrentState + 1
	bit	7, (hl)
	ret	NZ
	dec	hl
	ld	a, #0x07
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00122$
	bit	7, d
	jr	NZ, 00123$
	cp	a, a
	jr	00123$
00122$:
	bit	7, d
	jr	Z, 00123$
	scf
00123$:
	ret	C
	ld	hl, #_CurrentState
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00124$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00124$:
	jp	00102$
	jp	00101$
	jp	00104$
	jp	00103$
	jp	00105$
	jp	00107$
	jp	00106$
	jp	00108$
;main.c:54: case SPLASHSTATELOAD:
00101$:
;main.c:55: CurrentState = SplashLoadState();
	call	_SplashLoadState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:56: break;
	ret
;main.c:57: case SPLASHSTATE:
00102$:
;main.c:58: CurrentState = SplashState();
	call	_SplashState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:59: break;
	ret
;main.c:60: case MENUSTATELOAD:
00103$:
;main.c:61: CurrentState = MenuLoadState();
	call	_MenuLoadState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:62: break;
	ret
;main.c:63: case MENUSTATE: // Menu State!
00104$:
;main.c:64: CurrentState = MenuState();
	call	_MenuState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:65: break;
	ret
;main.c:66: case GAMESTATE: // Game State!
00105$:
;main.c:67: CurrentState = GameState();
	call	_GameState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:68: break;
	ret
;main.c:69: case GAMESTATEFAIL: // Game State!
00106$:
;main.c:70: CurrentState = GameFailState();
	call	_GameFailState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:71: break;
	ret
;main.c:72: case GAMESTATELOAD: // Game load State!
00107$:
;main.c:73: CurrentState = GameLoadState();
	call	_GameLoadState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:74: break;
	ret
;main.c:75: case GAMESTATERESET: // Game Reset State!
00108$:
;main.c:76: CurrentState = GameResetState();
	call	_GameResetState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:78: }
;main.c:79: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
