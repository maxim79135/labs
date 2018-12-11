unit SeaFightBotImpl;

{$mode objfpc}{$H+}

interface

type
  TByteArray = array of Byte;
  TByteArray2D = array of TByteArray;
  
var main_array : array [0..9, 0..9] of byte;
  
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

end;

function shoot : TByteArray;
begin
  TByteArray.Create(0);
end;

procedure shootResult(resultCode : integer);
begin

end;

procedure rivalShoot(point : TByteArray);
begin

end;

procedure SetParams(setsPerGame : integer);
begin

end;

procedure onCurrentSetEnd;
begin

end;

procedure onCurrentGameEnd;
begin

end;

end.