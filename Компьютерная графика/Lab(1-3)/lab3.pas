uses GraphABC;

var e, x1, x2, y1, y2, x, y, dx, dy, s1, s2 : real;
  R, G, B : byte;
  l : boolean;
begin
  readln(x1, y1, x2, y2, R, G, B);
  x := x1;
  y := y1;
  dx := abs(x2- x1);
  dy := abs(y2 - y1);
  s1 := sign(x2 - x1);
  s2 := sign(y2 - y1);
  if (dy < dx) then l := false else begin l := true; swap(dx, dy); end; 
  e := 2 * dy - dx;
  for var i := 1 to round(dx + dy) do begin
    SetPixel(round(x), round(y), RGB(R, G, B));
    if (e < 0) then begin
      if (l = true) then y := y + s2 else x := x + s1;
      e := e + 2 * dy;
    end else begin
      if (l = true) then x := x + s1 else y := y + s2;
      e := e - 2 * dx;
    end;
  end;
  SetPixel(round(x), round(y), RGB(R, G, B));
end.