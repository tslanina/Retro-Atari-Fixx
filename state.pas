procedure StateMachineReset;
begin
 stateNext := STATE_INVALID;
 stateCurrent := STATE_INVALID;
 stateCounter := 0;
end;

procedure StateMachineSetNextState(state :byte);
begin
 stateNext := state
end;

procedure StateMachineRun;
begin
 if stateNext <> STATE_INVALID then begin
  stateCounter := 0;
  stateCurrent := stateNext;
  stateNext := STATE_INVALID;
  DefaultColors;
 end;
end;