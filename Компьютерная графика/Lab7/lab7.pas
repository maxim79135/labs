uses GraphABC;

type TXY = record x, y : integer; end;
const V : array [0..4] of TXY = (
  (x :  50;  y : 50),
  (x :  100; y : 30),
  (x :  130; y : 60),
  (x :  70;  y : 80),
  (x :  30;  y : 70)
);
  dx = 200;
  
var a : array [0..4] of TXY;
  st : array [0..10000] of TXY;
  i, x0, y0 : integer;
  size, wx, xr : integer;
  
procedure draw_item();
var i : integer;
begin
  for i := 0 to 4 do Line(a[i].x + dx, a[i].y + dx, a[(i + 1) mod 5].x + dx, a[(i + 1) mod 5].y + dx);
end;

procedure MouseDown(x,y,mb: integer);
begin
  if (mb = 1) then begin
    x0 := x;
    y0 := y;
    size := 0;
    st[size].x := x0;
    st[size].y := y0;
    inc(size);
    while (size <> 0) do begin
      PutPixel(st[size - 1].x, st[size - 1].x, clRed);
      dec(size);
      wx := st[size].x; inc(st[size].x);
    while (GetPixel(st[size].x, st[size].y) <> clWhite) do begin
      if (st[size].x > 400) then exit;
      PutPixel(st[size].x, st[size].y, clRed);
      inc(st[size].x);
    end;
    xr := st[size].x - 1;
    st[size].x := wx;
    dec(st[size].x);
    while (GetPixel(st[size].x, st[size].y) <> clBlack) do begin
      PutPixel(st[size].x, st[size].y, clRed);
      dec(st[size].x);
    end;
  end;
  end;
end;

begin
  OnMouseDown := MouseDown;
  SetPenColor(clBlack);
  for i := 0 to 4 do begin
             a[i].x := V[i].x;
             a[i].y := V[i].y;
           end;
  draw_item();
 
  
end.