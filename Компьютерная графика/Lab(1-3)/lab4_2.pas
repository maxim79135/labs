uses GraphABC;

var y, rad, e : real;
  R, G, B : byte;
  x : integer;
begin
  readln(rad, R, G, B);
  x := 0;
  y := rad;
  e := 3 - 2 * rad;
  for x := 0 to round(rad) do begin
    y := sqrt(rad*rad-x*x);
    SetPixel(round(x) + 100, round(y) + 100, RGB(R, G, B));
    SetPixel(round(-x) + 100, round(y) + 100, RGB(R, G, B));
    SetPixel(round(x) + 100, round(-y) + 100, RGB(R, G, B));
    SetPixel(round(-x) + 100, round(-y) + 100, RGB(R, G, B));
  end;
end.