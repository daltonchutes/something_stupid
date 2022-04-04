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
	.globl _GameLoadFailState
	.globl _GameFailState
	.globl _GameResetState
	.globl _GameLoadState
	.globl _GameState
	.globl _MenuLoadState
	.globl _MenuState
	.globl _SplashLoadState
	.globl _SplashState
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _add_VBL
	.globl _vbl_count
	.globl _CurrentState
	.globl _vbl_update
	.globl _Init
	.globl _Update
	.globl _UpdateGame
	.globl _sign
	.globl _min
	.globl _max
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
;C:/Users/rutha/Documents/GitHub/something_stupid/gbdk/include/gb/gb.h:671: __asm__("di");
	di
;main.c:30: add_VBL(vbl_update);
	ld	de, #_vbl_update
	push	de
	call	_add_VBL
	pop	hl
;main.c:31: set_interrupts(VBL_IFLAG);
	ld	a, #0x01
	push	af
	inc	sp
	call	_set_interrupts
	inc	sp
;C:/Users/rutha/Documents/GitHub/something_stupid/gbdk/include/gb/gb.h:655: __asm__("ei");
	ei
;main.c:34: CurrentState = MENUSTATELOAD;
	ld	hl, #_CurrentState
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;main.c:35: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:36: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:37: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:38: }
	ret
;main.c:40: void Update()
;	---------------------------------
; Function Update
; ---------------------------------
_Update::
;main.c:42: while (1)
00104$:
;main.c:44: if(vbl_count == 0){
	ld	hl, #_vbl_count + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00102$
;main.c:45: wait_vbl_done();
	call	_wait_vbl_done
00102$:
;main.c:47: vbl_count = 0;
	xor	a, a
	ld	hl, #_vbl_count
	ld	(hl+), a
	ld	(hl), a
;main.c:50: UpdateGame();
	call	_UpdateGame
;main.c:51: gbt_update();
	call	_gbt_update
;main.c:54: }
	jr	00104$
;main.c:56: void UpdateGame()
;	---------------------------------
; Function UpdateGame
; ---------------------------------
_UpdateGame::
;main.c:58: switch(CurrentState)
	ld	hl, #_CurrentState + 1
	bit	7, (hl)
	ret	NZ
	dec	hl
	ld	a, #0x08
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00123$
	bit	7, d
	jr	NZ, 00124$
	cp	a, a
	jr	00124$
00123$:
	bit	7, d
	jr	Z, 00124$
	scf
00124$:
	ret	C
	ld	hl, #_CurrentState
	ld	c, (hl)
	ld	b, #0x00
	ld	hl, #00125$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00125$:
	jp	00102$
	jp	00101$
	jp	00104$
	jp	00103$
	jp	00105$
	jp	00107$
	jp	00106$
	jp	00108$
	jp	00109$
;main.c:60: case SPLASHSTATELOAD:
00101$:
;main.c:61: CurrentState = SplashLoadState();
	call	_SplashLoadState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:62: break;
	ret
;main.c:63: case SPLASHSTATE:
00102$:
;main.c:64: CurrentState = SplashState();
	call	_SplashState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:65: break;
	ret
;main.c:66: case MENUSTATELOAD:
00103$:
;main.c:67: CurrentState = MenuLoadState();
	call	_MenuLoadState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:68: break;
	ret
;main.c:69: case MENUSTATE: // Menu State!
00104$:
;main.c:70: CurrentState = MenuState();
	call	_MenuState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:71: break;
	ret
;main.c:72: case GAMESTATE: // Game State!
00105$:
;main.c:73: CurrentState = GameState();
	call	_GameState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:74: break;
	ret
;main.c:75: case GAMESTATEFAIL: // Game State!
00106$:
;main.c:76: CurrentState = GameFailState();
	call	_GameFailState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:77: break;
	ret
;main.c:78: case GAMESTATELOAD: // Game load State!
00107$:
;main.c:79: CurrentState = GameLoadState();
	call	_GameLoadState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:80: break;
	ret
;main.c:81: case GAMESTATERESET: // Game Reset State!
00108$:
;main.c:82: CurrentState = GameResetState();
	call	_GameResetState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:83: break;
	ret
;main.c:84: case GAMESTATELOADFAIL:
00109$:
;main.c:85: CurrentState = GameLoadFailState();
	call	_GameLoadFailState
	ld	hl, #_CurrentState
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:87: }
;main.c:88: }
	ret
;main.c:90: int sign(int x) {
;	---------------------------------
; Function sign
; ---------------------------------
_sign::
;main.c:91: return (x > 0) - (x < 0);
	ldhl	sp,	#2
	xor	a, a
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00103$
	bit	7, d
	jr	NZ, 00104$
	cp	a, a
	jr	00104$
00103$:
	bit	7, d
	jr	Z, 00104$
	scf
00104$:
	ld	a, #0x00
	rla
	ld	c, a
	ld	b, #0x00
	ldhl	sp,	#3
	ld	a, (hl)
	rlca
	and	a,#0x01
	ld	e, a
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	d, a
;main.c:92: }
	ret
;main.c:94: int min(int a, int b) {
;	---------------------------------
; Function min
; ---------------------------------
_min::
;main.c:95: if (a > b)
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00110$
	bit	7, d
	jr	NZ, 00111$
	cp	a, a
	jr	00111$
00110$:
	bit	7, d
	jr	Z, 00111$
	scf
00111$:
	jr	NC, 00102$
;main.c:96: return b;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ret
00102$:
;main.c:97: return a;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;main.c:98: }
	ret
;main.c:100: int max(int a, int b) {
;	---------------------------------
; Function max
; ---------------------------------
_max::
;main.c:101: if (a < b)
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00110$
	bit	7, d
	jr	NZ, 00111$
	cp	a, a
	jr	00111$
00110$:
	bit	7, d
	jr	Z, 00111$
	scf
00111$:
	jr	NC, 00102$
;main.c:102: return b;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ret
00102$:
;main.c:103: return a;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;main.c:104: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
