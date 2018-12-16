unit SeaFightBotImpl;

{$mode objfpc}{$H+}

interface

type
  TByteArray = array of Byte;
  TByteArray2D = array of TByteArray;
  
var main_array : array [0..9, 0..9] of byte;
  n : integer;  
const
  EMPTY = 0;
  
  BLOCK = 1;
  
  DAMAGE = 2;
  
  KILL = 3;
  
  function getMap : TByteArray2D;
  function shoot : TByteArray;
  procedure shootResult(resultCode : integer);
  procedure rivalShoot(point : TByteArray);
  procedure SetParams(setsPerGame : integer);
  procedure onCurrentSetEnd;
  procedure onCurrentGameEnd;
  
implementation

function getMap : TByteArray2D;
begin
  result := TByteArray2D.Create(
      TByteArray.Create(0, 1, 0, 0, 0, 0, 1, 0, 0, 0),
      TByteArray.Create(0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
      TByteArray.Create(1, 1, 1, 0, 0, 0, 1, 0, 0, 1),
      TByteArray.Create(0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
      TByteArray.Create(0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
      TByteArray.Create(0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
      TByteArray.Create(1, 1, 0, 0, 0, 1, 0, 0, 1, 1),
      TByteArray.Create(0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
      TByteArray.Create(0, 0, 0, 0, 0, 1, 0, 1, 0, 0),
      TByteArray.Create(0, 0, 1, 0, 0, 1, 0, 0, 0, 0)
  );
end;

function shoot : TByteArray;
var i, j : integer;
begin
  for i := 0 to 9 do 
    for j := 0 to 9 do
      if (main_array[i, j] = 0) then begin
        main_array[i, j] := 1;
        result := TByteArray.Create(i, j);
      end;
end;

procedure shootResult(resultCode : integer);
begin

end;

procedure rivalShoot(point : TByteArray);
begin

end;

procedure SetParams(setsPerGame : integer);
var i, j : integer;
begin
  for i := 0 to 9 do 
    for j := 0 to 9 do
      main_array[i, j] := 0;
end;

procedure onCurrentSetEnd;
begin

end;

procedure onCurrentGameEnd;
begin

end;

end.