procedure sfxUpdate;
begin
 if (goals and GOAL_AUDIO) <> 0 then
 begin
  Sound(0, Random(255), 10, 3);
 end;
end;

procedure sfxStop;
begin
 Sound(0, 0, 0, 0);
end;

procedure sfxPlay(n : byte);
 var i: byte;
begin
 if ( (goals and GOAL_AUDIO) = 0 ) or (CHEAT = true) then
 begin
		case n of
	        SFX_ITEM: begin
				Sound(0, 120, 10, 8); Delay(30); 
				Sound(0, 150, 10, 8); Delay(30); 
				Sound(0, 180, 10, 8); Delay(50); 
				Sound(0, 0, 0, 0);
	        end;
			
			SFX_GAMEOVER: begin
  				Sound(0, 120, 10, 8); Delay(120);
  				Sound(0, 150, 10, 8); Delay(120);
  				Sound(0, 180, 10, 8); Delay(120);
  				Sound(0, 200, 10, 8); Delay(120);
  				Sound(0, 150, 10, 8); Delay(100);
  				Sound(0, 180, 10, 8); Delay(150);
  				Sound(0, 0, 0, 0);
	        end;

	         SFX_NEXT: begin
				Sound(0, 200, 10, 8); Delay(150); 
				Sound(0, 160, 10, 8); Delay(150);
				Sound(0, 120, 10, 8); Delay(200); 
				for i := 120 downto 20 do begin 
					Sound(0, i, 10, 8); Delay(6); 
				end; 
				Sound(0, 0, 0, 0);
	        end;

	        SFX_START: begin
	        	Sound(0, 140, 10, 10); Sound(1, 100, 10, 6); Delay(150);
	        	Sound(0, 160, 10, 10); Sound(1, 100, 10, 6); Delay(150);
	        	Sound(0, 180, 10, 10); Sound(1, 120, 10, 6); Delay(200);
	        	Sound(0, 200, 10, 10); Sound(1, 150, 10, 6); Delay(150);
	        	Sound(0, 180, 10, 10); Sound(1, 130, 10, 6); Delay(150);
	        	Sound(0, 220, 10, 10); Sound(1, 160, 10, 6); Delay(200);
	        	Sound(0, 240, 10, 10); Sound(1, 180, 10, 6); Delay(200); 
	        	Sound(0, 0, 0, 0); Sound(1, 0, 0, 0);
				end;
	        SFX_MOVE: begin
				Sound(0, 220, 10, 8);Delay(8);
		        Sound(0, 0, 0, 0);
	        end;

	        SFX_COAL: begin
	        	Sound(0, 180, 10, 10); Sound(1, 120, 10, 6); Delay(40);
  				Sound(0, 210, 10, 10); Sound(1, 150, 10, 6); Delay(40);
  				Sound(0, 240, 10, 10); Sound(1, 160, 10, 6); Delay(90);
  				Sound(0, 0, 0, 0); Sound(1, 0, 0, 0);
			end;

			SFX_WIN: begin
				Sound(0, 200, 10, 10); Sound(1, 150, 10, 6); Delay(140);
				Sound(0, 220, 10, 10); Sound(1, 160, 10, 6); Delay(140);
				Sound(0, 240, 10, 10); Sound(1, 170, 10, 6); Delay(160);

				Sound(0, 255, 10, 10); Sound(1, 180, 10, 6); Delay(150);
				Sound(0, 230, 10, 10); Sound(1, 160, 10, 6); Delay(150);
				Sound(0, 250, 10, 10); Sound(1, 180, 10, 6); Delay(180);

				Sound(0, 210, 10, 10); Sound(1, 150, 10, 6); Delay(130);
				Sound(0, 230, 10, 10); Sound(1, 170, 10, 6); Delay(130);
				Sound(0, 255, 10, 10); Sound(1, 190, 10, 6); Delay(200);

				Sound(0, 240, 10, 10); Sound(1, 180, 10, 6); Delay(200);
				Sound(0, 0, 0, 0);     Sound(1, 0, 0, 0);

			end;

	    end;
    end;
end;
