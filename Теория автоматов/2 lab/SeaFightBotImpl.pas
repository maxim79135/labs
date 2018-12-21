unit SeaFightBotImpl;
interface
{$mode objfpc}{$H+}
type
TByteArray = array of Byte;
TByteArray2D = array of TByteArray;
const
EMPTY = 0;
BLOCK = 1;
DAMAGE = 2;
KILL = 3;
var
i,j,cur_i,cur_j:integer;
dir: byte;
set_num: integer;
set_num_mod: Integer;
visited: array[0..9,0..9] of Boolean;
dobivaem,promah: boolean;
//leftCells: Integer;
//firstGame: Boolean = true;
function getMap: TByteArray2D;
function shoot: TByteArray;
procedure shootResult(resultCode: integer);
procedure rivalShoot(point: TByteArray);
procedure setParams(setsPerGame: integer);
procedure onCurrentSetEnd;
procedure onCurrentGameEnd;
implementation
function getMap: TByteArray2D;
var
i: Integer;
begin
for i := 0 to 9 do 
 begin
  for j:=0 to 9 do
    begin
     visited[i,j] := false; // Флаги о посещении клеток
    end;
 end;
set_num_Mod:=set_num mod 3;
 case set_num_Mod of
  0:
   begin
    result := TByteArray2D.Create(
    TByteArray.Create(1, 0, 1, 0, 0, 0, 0, 0, 0, 1),
    TByteArray.Create(1, 0, 1, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(1, 0, 1, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(1, 0, 0, 0, 0, 1, 0, 0, 0, 0),
    TByteArray.Create(0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(1, 0, 1, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(1, 0, 1, 0, 0, 0, 0, 0, 0, 1),
    TByteArray.Create(0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(1, 0, 1, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(1, 0, 1, 0, 0, 0, 0, 1, 0, 0)
    );
   end;
  1:
   begin
    result := TByteArray2D.Create(
    TByteArray.Create(1, 0, 1, 1, 1, 0, 1, 1, 0, 1),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 0, 0, 0, 1),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(1, 0, 0, 0, 0, 1, 0, 0, 0, 1),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(1, 1, 0, 0, 0, 0, 1, 0, 0, 1)
    );
   end;
  2:
   begin
    result := TByteArray2D.Create(
    TByteArray.Create(1, 0, 0, 1, 0, 0, 0, 1, 0, 1),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 0, 0, 0, 1),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 0, 0, 0, 1),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(0, 0, 0, 0, 0, 0, 1, 0, 0, 1),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 0, 0, 0, 1),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 0, 0, 0, 0),
    TByteArray.Create(0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 0, 0, 0, 1),
    TByteArray.Create(1, 0, 0, 0, 0, 0, 1, 0, 0, 1)
    );
   end;   
 end;
set_num:=set_num+1;
end;
function shoot: TByteArray;

begin
if dobivaem=false then
 begin
  i:=0; j:=0;
  while visited[i,j]=true do
   begin
    if j<9 then j:=j+1
    else 
     begin
        j:=0;
        i:=i+1;
     end;
   end;
   cur_i:=i;
   cur_j:=j;
   if visited[cur_i,cur_j]=false then begin visited[i,j]:=true; result:= TByteArray.Create(i,j);  end;
  end
 else
 begin
  if (dir=0)and(cur_j<9)and(visited[cur_i,cur_j+1]=false) then
   begin
    cur_j:=cur_j+1;
    visited[cur_i,cur_j]:=true;
    result:= TByteArray.Create(cur_i,cur_j);   
   end
  else
   begin
    if (cur_i<9)and(visited[cur_i+1,cur_j]=false) then
     begin
      dir:=1;
      cur_i:=cur_i+1;
      visited[cur_i,cur_j]:=true;
      result:= TByteArray.Create(cur_i,cur_j); 
     end;
   end;
 end;
end;
procedure shootResult(resultCode: integer);
begin
if dobivaem=false then 
 begin
   if resultCode=2 then 
    begin
     dobivaem:=true;
     dir:=0;
    end;
  if resultCode=0 then
   begin
     dobivaem:=false;
     dir:=0;
   end;  
  if resultCode=3 then
   begin
     dobivaem:=false;
     dir:=0;
   end;   
 end
else
 begin
  if resultCode=2 then
   begin
     dobivaem:=true; 
   end;
  if resultCode=3 then
   begin
     dobivaem:=false;
     dir:=0;
   end; 
  if resultCode=0 then
   begin
     dobivaem:=true;
     cur_j:=cur_j-1;
     dir:=1;
   end;   
 end;
end;
procedure rivalShoot(point: TByteArray);
begin
end;
procedure setParams(setsPerGame: integer);
var
i: Integer;
begin
set_num:=1;
Dobivaem:=false;
dir:=0;
end;
procedure onCurrentSetEnd;
begin
end;
procedure onCurrentGameEnd;
begin
end;
end.