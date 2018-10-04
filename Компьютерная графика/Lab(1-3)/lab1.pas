uses GraphABC;

var y, m, y1, y2 : real;
  x1, x2 : integer;
  R, G, B : byte;
begin
  readln(x1, y1, x2, y2, R, G, B);
  if (x1 <> x2) then begin m := (y2 - y1) / (x2 - x1); y := y1; end;
  for var x := x1 to x2 do begin
    SetPixel(x, round(y), RGB(R, G, B));
    y := y + m;
  end;
  if (y1 = y2) then SetPixel(x1, round(y1), RGB(R, G, B));
end.
