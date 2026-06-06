procedure AddEnemy(x, y, t, m, c, d: byte); 
 var index: byte;
begin
 if numEnemies < MAX_ENEMIES then
 begin
  index := numEnemies * ENEMY_SIZE;
  enemies[index + OFFSET_TYPE] := t;
  enemies[index + OFFSET_X] := x;
  enemies[index + OFFSET_Y] := y;
  enemies[index + OFFSET_MODE] := m;
  enemies[index + OFFSET_CNT] := c;
  enemies[index + OFFSET_DELAY] := d;
  inc(numEnemies)
 end;
end;

procedure EnemiesRun;
 var i :byte;
 index: byte;
 collider: boolean;
 frame: byte;
 oldx, oldy, tmp : byte;
begin
 index := 0;
 frame := 255;
 for i := 0 to (numEnemies -1) do begin
  collider := false;
  oldx := enemies[index+1];
  oldy := enemies[index+2];
  case enemies[index] of
   0: begin  //mine  
    tmp := enemies[index+OFFSET_CNT];
    tmp := tmp+1;
    if tmp > enemies[index+5] then begin
     tmp := 0;
     enemies[index+3] := enemies[index+3] +1;
    end;
    enemies[index+OFFSET_CNT] := tmp;
    frame:=minegfx[enemies[index+3]];
    if frame = 255 then begin
     enemies[index+3] := 0;
     frame:=minegfx[enemies[index+3]];
    end;

    if frame <> GFX_BG then collider:=true;            
   end;
         
   1: begin  //h
    tmp := enemies[index+OFFSET_CNT];
    tmp := tmp+1;
    if tmp > enemies[index+OFFSET_DELAY] then begin
     tmp := 0;
     //move in direction
     case enemies[index+OFFSET_MODE] of
      0: enemies[index+OFFSET_Y] := enemies[index+OFFSET_Y] - 1;
      1: enemies[index+OFFSET_Y] := enemies[index+OFFSET_Y] + 1;
      2: enemies[index+OFFSET_X] := enemies[index+OFFSET_X] - 1;
      3: enemies[index+OFFSET_X] := enemies[index+OFFSET_X] + 1;
     end;
    
     if LevelMap^[enemies[index+OFFSET_Y]][enemies[index+OFFSET_X]] = 1 then
     begin
      enemies[index+OFFSET_X] := oldx;
      enemies[index+OFFSET_Y] := oldy;
      enemies[index+OFFSET_MODE] := modeLookup[enemies[index+OFFSET_MODE]];
     end;
    end;
    enemies[index+OFFSET_CNT] := tmp;
    frame:= enemyGfx[(counter + index + index +index +index) and 15];
    collider:=true;            
   end;
  end;

  if frame < 255 then 
  begin
   scr := dpeek(88);
   Inc(scr, ytab[oldy]);
   Poke(scr+oldx, GFX_BG);

   scr := dpeek(88);
   Inc(scr, ytab[enemies[index+OFFSET_Y]]);
   Poke(scr+enemies[index+OFFSET_X], frame);
  end;

  if collider = true then begin
   if(enemies[index+OFFSET_X] = playerX) and (enemies[index+OFFSET_Y] = playerY) then isDead:= true;
  end;
  index := index + ENEMY_SIZE;
 end;
end;
