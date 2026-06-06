var
  counter: byte;
  playerX, playerY: byte;
  numEnemies: byte;

  LevelMap: ^TMap;
  ItemList: ^TItems;

  stateCurrent, stateNext, stateCounter : byte;
  
  scr : word;
  oldInput: byte;
  goals: byte;

  progress: byte;

  itemProgress: byte; // 0-5
  itemX, itemY, itemType : byte;
  itemLoc : byte;
  level: byte;
  itemLocations: array[0..(MAX_LEVEL_ITEM_POINTS*2)] of byte;
  numItemLoc: byte;
  
  enemies: array[0..(ENEMY_SIZE*MAX_ENEMIES)] of byte;
  
  isDead: boolean;

  coalCounter: byte;

  playerIdleCounter: byte;
