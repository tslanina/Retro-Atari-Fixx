procedure runPlayer;
  var
    px,py : byte;
    
    cell: byte;
    frame: byte;

    input: byte;
    tmp: byte;

    leftMask, rightMask : byte;

const 
	upMask = 1;
	downMask = 2;
	leftMaskC = 4;
	rightMaskC = 8;

begin
  px := playerX;
  py := playerY;
  tmp := STICK0 xor 255;

  input := (tmp xor oldInput) and tmp;
  oldInput := tmp;

  if (CHEAT = false) and ((goals and GOAL_STICK) <> 0) then
  begin
  	rightMask := leftMaskC;
  	leftMask := rightMaskC;
  end else begin
  	leftMask := leftMaskC;
  	rightMask := rightMaskC;
  end;

  if (input and leftMask) <> 0 then dec(px);
  if (input and rightMask)  <> 0 then inc(px);
  if (input and upMask) <> 0 then dec(py);
  if (input and downMask) <> 0 then inc(py);


    if playerIdleCounter < 100 then playerIdleCounter := playerIdleCounter + 1;

    if(px <> playerX) or (py <> playerY) then
    begin

      playerIdleCounter:=0;
      sfxPlay(SFX_MOVE);

      if (px >19) or (py >19) then
        begin
          isDead := true;
        end;

       // index := ytab[py]+px;
        cell := LevelMap^[py][px];
        if cell = 1 then
        begin
          isDead := true;
        end;


        if isDead = false then
        begin
          scr := dpeek(88);
          Inc(scr, ytab[playerY]);
          Poke(scr+playerx, GFX_BG);
          playerX := px;
          playerY := py;
        end;

      end;
  frame := playerLookup [ counter and 7];

  if playerIdleCounter < IDLE_DELAY then frame := playerLookup[0];

  scr := dpeek(88);
  Inc(scr, ytab[playerY]);
  Poke(scr+playerx, frame)
end;
