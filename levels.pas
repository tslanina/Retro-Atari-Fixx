procedure stateLevelsRun;
 var i,color:byte;
 var offset, tmp, input: byte;
begin
if stateCounter = 0 then begin
  Cls;
  Print(4, 1,   $c0, 'SELECT LEVEL');
  offset := progress;

  for i := 1 to 9 do
  begin
  	color := $40;
  	if(i > progress) then color := $80;
  	Print(6, 3+2*i,  color, 'LEVEL');
  	PrintB(14,3+2*i, i+$10 or color);
  end; 

  

  stateCounter := 1;
 end else begin

 if strig0 = 0 then begin
  SfxPlay(SFX_START);
  DefaultColors;
  level := offset - 1;
  StateMachineSetNextState(STATE_LEVELSTART);
 end;

 tmp := STICK0 xor 255;
 input := (tmp xor oldInput) and tmp;
 oldInput := tmp;
PrintB(4,3+2*offset,  0);
 if (input and 1) <> 0 then dec(offset);
 if (input and 2) <> 0 then inc(offset);
 if(offset <1) then offset := 1;
 if (offset > progress) then offset := progress;
	PrintB(4,3+2*offset,  playerLookup [counter and 7]);
 pause(1);
end;

end;

