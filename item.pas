procedure FindItemLocation;
var loc:byte;
begin
 loc := Random(numItemLoc);
 if loc = itemLoc then
  begin
   if loc = 0 then begin
	loc := 1;
   end else begin
	loc := loc -1;
   end;
  end;
 itemLoc := loc;
 loc := loc + loc;
 itemX := itemLocations[loc];
 itemY := itemLocations[loc + 1];
 itemType := ItemList^[itemProgress];
end;

procedure AddItemLocation(x, y: byte);
begin
 itemLocations[numItemLoc*2] := x;
 itemLocations[numItemLoc*2+1] := y;
 Inc(numItemLoc);
end;

procedure RunItem;
 var tmp:byte;
begin
 if itemType <> ITEM_END then begin
  if (itemX = playerX) and (itemY = playerY) then begin
   if itemType = ITEM_COAL then SfxPlay(SFX_COAL) else SfxPlay(SFX_ITEM);
   itemProgress := itemProgress+1;
   case itemType of
    ITEM_STICK: goals := goals and ( not GOAL_STICK);
    ITEM_VIDEO: goals := goals and ( not GOAL_VIDEO);
    ITEM_AUDIO: begin; 
     goals := goals and ( not GOAL_AUDIO); 
     SfxStop; 
    end;
    ITEM_COAL: coalCounter := coalCounter + 1;
   end;	
   FindItemLocation;
   if itemType = ITEM_END then StateMachineSetNextState(STATE_LEVELEND);
  end;
  if itemType <> ITEM_END then begin
   if ( counter and $4 ) = 0 then tmp := itemGfxLookup[itemType] else tmp := GFX_BG;
   scr := Dpeek(88);
   Inc(scr, ytab[itemY]);
   Poke(scr+itemX,  tmp);
  end;
 end;
end;
