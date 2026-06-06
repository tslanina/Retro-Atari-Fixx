function CollideBG(x,y :byte):boolean;
begin
 CollideBG:= false;
 if LevelMap[y][x] <> 0 then CollideBG := true;
end;

procedure UpdateProgress(n: byte);
begin
  if(progress < n) then progress := n;
end;

procedure SetMapData;
begin
case level of
  0: begin LevelMap := @LevelP1; ItemList := @itemLookupP1; goals := 0; UpdateProgress(1); end;
  1: begin LevelMap := @LevelP2; ItemList := @itemLookupP2; goals := GOAL_AUDIO; UpdateProgress(2); end;
  2: begin LevelMap := @LevelP3; ItemList := @itemLookupP3; goals := GOAL_VIDEO; UpdateProgress(3); end;
  3: begin LevelMap := @LevelP4; ItemList := @itemLookupP4; goals := GOAL_STICK; UpdateProgress(4); end;
  4: begin LevelMap := @LevelMap1; ItemList := @itemLookupLevel; goals:= GOAL_AUDIO or GOAL_VIDEO or GOAL_STICK; UpdateProgress(5); end;
  5: begin LevelMap := @LevelMap2; ItemList := @itemLookupLevel; goals:= GOAL_AUDIO or GOAL_VIDEO or GOAL_STICK; UpdateProgress(6); end;
  6: begin LevelMap := @LevelMap3; ItemList := @itemLookupLevel; goals:= GOAL_AUDIO or GOAL_VIDEO or GOAL_STICK; UpdateProgress(7); end;
  7: begin LevelMap := @LevelMap4; ItemList := @itemLookupLevel; goals:= GOAL_AUDIO or GOAL_VIDEO or GOAL_STICK; UpdateProgress(8); end;
  8: begin LevelMap := @LevelMap5; ItemList := @itemLookupLevel; goals:= GOAL_AUDIO or GOAL_VIDEO or GOAL_STICK; UpdateProgress(9); end;
 end;
end;

procedure InitMap;
 var x, y, a : byte;
 scr : word;
begin
 numEnemies := 0;
 numItemLoc := 0;
 playerX := 10;
 playerY := 10;

 playerIdleCounter := 0;
 oldInput := 0;

 itemLoc := 0;
 itemProgress := 0;

 coalCounter := 0;

 
 scr := DPeek(88);
 for y := 0 to 19 do begin
  for x := 0 to 19 do begin
   a := LevelMap^[y][x];
   if (a > 0) and (a < 3) then begin
    Inc(a, $40);
    Poke(scr+x, a)
   end else 
   begin
     case a of 
      9: AddItemLocation(x,y);	
      3: begin 
       playerX := x;
       playerY := y;
      end; 
      10: AddEnemy(x,y,0,0,0,1);
      11: AddEnemy(x,y,0,5,0,1);
      12: AddEnemy(x,y,0,10,0,1);
      13: AddEnemy(x,y,0,15,0,10);
      14: AddEnemy(x,y,0,0,0,10);

      50: AddEnemy(x,y,1,2,0,2); // h fast
      52: AddEnemy(x,y,1,3,0,5); // h slow
      55: AddEnemy(x,y,1,2,0,1); // h  fast
      51: AddEnemy(x,y,1,0,0,0); // v fast
      53: AddEnemy(x,y,1,0,0,1); // v fast
      
      54: AddEnemy(x,y,1,0,0,6); // v slow
     end;
    end;
  end;
  Inc(scr, 20);
 end;
 findItemLocation;
end;
