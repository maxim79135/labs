uses GraphABC;

var x, y, rad, e : real;
  R, G, B : byte;
begin
  readln(rad, R, G, B);
  x := 0;
  y := rad;
  e := 3 - 2 * rad;
  while (x <= y) do begin
    SetPixel(round(x) + 250, round(y) + 100, RGB(R, G, B));
    SetPixel(round(y) + 100, round(x) + 100, RGB(R, G, B));
    SetPixel(round(y) + 100, round(-x) + 100, RGB(R, G, B));
    SetPixel(round(x) + 100, round(-y) + 100, RGB(R, G, B));
    SetPixel(round(-x) + 100, round(-y) + 100, RGB(R, G, B));
    SetPixel(round(-y) + 100, round(-x) + 100, RGB(R, G, B));
    SetPixel(round(-y) + 100, round(x) + 100, RGB(R, G, B));
    SetPixel(round(-x) + 100, round(y + 100), RGB(R, G, B));
    if (e < 0) then e := e + 4 * x + 6 else 
    begin 
      e := e + 4 * (x - y) + 10; y := y - 1;
    end;
      x := x + 1;
  end;
end.