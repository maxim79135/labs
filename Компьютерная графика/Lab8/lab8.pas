uses GraphABC;

function kod(x, y, xl, ya, xr, yb : integer) : byte;
var kp : byte;
begin
  kp := 0;
  if (x < xl) then kp := kp or $01;
  if (y < ya) then kp := kp or $02;
  if (x > xr) then kp := kp or $04;
  if (y > yb) then kp := kp or $08;
  kod:=kp;
end;


var xl, ya, xr, yb, x1, y1, x2, y2 : integer;
  p1, p2 : byte;
begin
  read(xl, ya, xr, yb);
  DrawRectangle(xl, ya, xr, yb);
  read(x1, y1, x2, y2);
  repeat
  p1 := kod(x1, y1, xl, ya, xr, yb);
  p2 := kod(x2, y2, xl, ya, xr, yb);
  if (p1 <> 0) and (p2 <> 0) then exit;
  if (p1 = 0) and (p2 = 0) then begin
    Line(x1, y1, x2, y2);
    exit;
  end;
  if (p1 = 0) then begin
    swap(x1, x2);
    swap(y1, y2);
    swap(p1, p2);
  end;
  if (x1 < xl) then begin
    y1 := y1 + round((y2 - y1) * (xl - x1) / (x2 - x1));
    x1 := xl;
  end else
  
  if (y1 < ya) then begin
    x1 := x1 + round((x2 - x1) * (ya - y1) / (y2 - y1));
    y1 := ya;
  end else 
  
  if (x1 > xr) then begin
    y1 := y1 + round((y2 - y1) * (xr - x1) / (x2 - x1));
    x1 := xr;
  end else
  
  if (y1 > yb) then begin
    x1 := x1 + round((x2 - x1) * (yb - y1) / (y2 - y1));
    y1 := yb;
  end;
  until (p1 = 0) and (p2 = 0);
  TextOut(10, 370, x1);
  write(x1, y1, x2, y2);
end.