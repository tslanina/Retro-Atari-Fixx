procedure defaultColors;
begin
 Poke(708, 116);
 Poke(709, $45);
 Poke(710, 152);
 Poke(711, 233);
end;

procedure menuColors;
begin
 Poke(708, $74); // logo
 Poke(709, $c6);  // itam names
 Poke(710, $48); //text
 Poke(711, $de);
end;

procedure SetColors;
begin
 DefaultColors;  
  if (goals and GOAL_VIDEO) <> 0 then
  begin
   if Random(255) > 32 then
   begin
    Poke(708, 116);
    Poke(709, 0);
    Poke(710, 152);
    Poke(711, 233);
   end;
  end; 

  if CHEAT = true then DefaultColors;

end;


procedure Print(x, y, c : byte; txt : string);
  var i: byte;
  z:byte;
begin
 scr := dpeek(88) + ytab[y];
 for i := 1 to Length(txt) do begin 
  z := Ord(txt[i]) and $7f -32;
  z := z or c;
  Poke(scr+x, z);
  x := x+1;
 end;
end;

procedure PrintB(x, y, b : byte);
var	scr : word;
begin
 scr := Dpeek(88) + ytab[y];
 Poke(scr+x, b);
end;

procedure drawFire;
begin
  if (counter and 16) = 0 then Print(5, 21,  $c0, 'PRESS FIRE') else Print(5, 21,  0, '          ');
end;

procedure Cls;
var
 i: byte;
 scr : word;
begin
  scr := dpeek(88);

  for i := 0 to 239 do begin
   Poke(scr , 0);
   Inc(scr);
   Poke(scr , 0);
   Inc(scr)
  end;
end;
