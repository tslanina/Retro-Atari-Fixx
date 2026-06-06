const CHEAT: boolean = false;
const CHEAT_COLLISION: boolean = false;

const GFX_PLAYER: byte = 7;
const ENEMY_SIZE = 6;
const GFX_BG = 0;
const MINE_GFX = 11 + $c0;
const MAX_ENEMIES = 20;
const GFX_ENEMY_F0 = 3 + $c0;
const GFX_ENEMY_F1 = 30 + $c0;

const IDLE_DELAY = 1;

const OFFSET_TYPE  = 0;
const OFFSET_X     = 1;
const OFFSET_Y     = 2;
const OFFSET_MODE  = 3;
const OFFSET_CNT   = 4;
const OFFSET_DELAY = 5;

const ITEM_STICK = 0;
const ITEM_VIDEO = 1;
const ITEM_AUDIO = 2;
const ITEM_COAL  = 3;
const ITEM_END   = 100;

const STATE_INVALID = 0;
const STATE_TITLE = 1;
const STATE_GAME = 2;
const STATE_GAMEOVER = 3;
const STATE_LEVELEND = 4;
const STATE_END = 5;
const STATE_LEVELSTART = 6;
const STATE_LEVELS = 7;

const SFX_ITEM = 0;
const SFX_NEXT = 1;
const SFX_GAMEOVER = 2;
const SFX_START = 3;
const SFX_MOVE = 4;
const SFX_COAL = 5;
const SFX_WIN = 6;

const GOAL_VIDEO = 1;
const GOAL_AUDIO = 2;
const GOAL_STICK = 4;

const MAX_LEVELS = 9;

const MAX_LEVEL_ITEMS = 8;
const MAX_LEVEL_ITEM_POINTS = 16;

type TMap = array[0..19, 0..19] of byte;
type TItems = array[0..MAX_LEVEL_ITEMS] of byte;

const itemLookupP1: TItems = ( ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_END, ITEM_END, ITEM_END, ITEM_END);
const itemLookupP2: TItems = ( ITEM_AUDIO, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_END, ITEM_END, ITEM_END);
const itemLookupP3: TItems = ( ITEM_VIDEO, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_END, ITEM_END, ITEM_END);
const itemLookupP4: TItems = ( ITEM_STICK, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_END, ITEM_END, ITEM_END);

const itemLookupLevel: TItems = ( ITEM_AUDIO, ITEM_VIDEO, ITEM_STICK, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_COAL, ITEM_END);

const LevelP1: TMap = ( {$I p1.inc} );
const LevelP2: TMap = ( {$I p2.inc} );
const LevelP3: TMap = ( {$I p3.inc} );
const LevelP4: TMap = ( {$I p4.inc} );

const LevelMap1: TMap = ( {$I l2.inc} );
const LevelMap2: TMap = ( {$I l1.inc} );
const LevelMap3: TMap = ( {$I l3.inc} );
const LevelMap4: TMap = ( {$I l4.inc} );
const LevelMap5: TMap = ( {$I l5.inc} );

const ytab: array[0..24] of word = ( 0,20,40,60,80,100,120,140,160,180,200,220,240,260,280,300,320,340,360,380,400,420,440,460,480);
const gfx: array[0..128] of byte = ( {$I gfx.inc} );
const gfx2: array[0..40] of byte = ( {$I gfx2.inc} );
const minegfx:  array[0..18] of byte = (
GFX_BG, GFX_BG, GFX_BG, GFX_BG, GFX_BG, GFX_BG, MINE_GFX,MINE_GFX+1,MINE_GFX+2,MINE_GFX+3,MINE_GFX+4,MINE_GFX+4,MINE_GFX+4,MINE_GFX+3,MINE_GFX+2,MINE_GFX+1,MINE_GFX,GFX_BG,255
);

const enemyGfx: array [0..15] of byte = (
	GFX_ENEMY_F0, GFX_ENEMY_F0, GFX_ENEMY_F0, GFX_ENEMY_F0, GFX_ENEMY_F0, GFX_ENEMY_F0, GFX_ENEMY_F0, GFX_ENEMY_F0,
	GFX_ENEMY_F0, GFX_ENEMY_F0, GFX_ENEMY_F0, GFX_ENEMY_F0, GFX_ENEMY_F0, GFX_ENEMY_F1, GFX_ENEMY_F1, GFX_ENEMY_F1
);

const modeLookup: array[0..3] of byte = (1,0,3,2);

const itemGfxLookup:array [0..3] of byte = (8+$80,10+$80,9+$80,4+$80);
const playerLookup: array[0..7] of byte = (GFX_PLAYER,GFX_PLAYER,GFX_PLAYER-1,GFX_PLAYER-2,GFX_PLAYER-1,GFX_PLAYER,GFX_PLAYER,GFX_PLAYER);

