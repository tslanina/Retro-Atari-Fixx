{-------------------------------------------------------------------------------

FIXX  v1B
24h Compo
(c) Tomasz Slanina - Dox/Joker
https://github.com/tslanina

-------------------------------------------------------------------------------}

uses graph, crt, joystick;


{$I const.inc}
{$I vars.inc}

{$I utils.pas}
{$I state.pas}
 

procedure RestartGame;
begin
 isDead := false;
 level := 1;
 stateMachineSetNextState(STATE_LEVELS);
end;


procedure InitPrg;
var
  topMem : word;
  chbas  : byte absolute $2f4;
  ramtop : byte absolute $6a;
begin
  Randomize;
  InitGraph(1 + 16);
  counter := 0;
  progress := 1;
  topMem := ramtop - 8;
  topMem := topMem shl 8;
  chbas := hi(topMem);
  Move(pointer(57344), pointer(topMem), 1023);
  Move(gfx, pointer(topMem), SizeOf(gfx));    
  topMem := topMem + 26*8;
  Move(gfx2, pointer(topMem), SizeOf(gfx2));   
end;

{$I sfx.pas}
{$I player.pas}
{$I enemies.pas}
{$I item.pas}
{$I map.pas}
{$I levels.pas}

procedure drawCoal;
  var a,i,x: byte;
begin
  Print(3,21,$c0,'LEVEL');
  PrintB(9,21, (level+209) );
  a := 4 - coalCounter;
  if a >10  then a := 0;
  x := 12;
  for i := 0 to a do begin
    PrintB(x,21, itemGfxLookup[3]);
    x:=x+1;
  end;

  a:=a+1;

  for i := a to 4 do begin
    PrintB(x,21, GFX_BG);
    x:=x+1;
  end;
end;

{$I states/levelstart.pas}
{$I states/game.pas}
{$I states/title.pas}
{$I states/gameover.pas}
{$I states/levelend.pas}
{$I states/end.pas}

begin
 Cls;
 DefaultColors;
 InitPrg;
  
 StateMachineReset;
 StateMachineSetNextState(STATE_TITLE);
  
 repeat
  inc(counter);
  case stateCurrent of
    STATE_TITLE: begin StateTitleRun end;
    STATE_GAME: begin StateGameRun end;
    STATE_LEVELEND: begin StateLevelEndRun end;
    STATE_GAMEOVER: begin StateGameOverRun end;
    STATE_END: begin StateEndRun end; 
    STATE_LEVELSTART: begin StateLevelStartRun end;
    STATE_LEVELS: begin StateLevelsRun end;
  end;

  if CHEAT_COLLISION = true then isDead := false;

  if isDead = true then begin
    StateMachineSetNextState(STATE_GAMEOVER);
    goals := 0;
  end;

  StateMachineRun
 until false;
end.

