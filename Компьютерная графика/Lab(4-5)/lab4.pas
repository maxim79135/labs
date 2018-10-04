uses GraphABC;
var xn, yn, i, j, x, y, m : integer;
  t, step : real;
  P, R : array [1..1000] of Point; 

procedure DrawRect(x1, y1, x2, y2 : real);  
var e, x, y, dx, dy, s1, s2 : real;
  R, G, B : byte;
  l : boolean;
begin
  x := x1;
  y := y1;
  dx := abs(x2- x1);
  dy := abs(y2 - y1);
  s1 := sign(x2 - x1);
  s2 := sign(y2 - y1);
  if (dy > dx) then begin l := true; swap(dx, dy); end else l := false; 
  e := 2 * dy - dx;
  for var i := 1 to round(dx) do begin
    SetPixel(round(x), round(y), clblack);
    while (e >= 0) do begin
      if (l = true) then x := x + s1 else y := y + s2;
      e := e - 2 * dx;
    end;
    if (l = true) then y := y + s2 else x := x + s1;
    e := e + 2 * dy;
  end;
  SetPixel(round(x), round(y), clblack);
end;
  
begin
  readln(m);
  for i := 1 to m do begin
    readln(xn, yn); 
    P[i].X := xn; P[i].Y := yn;
  end;
  x := P[1].X; y := P[1].Y; t := 0; step := 0.01;
  repeat
    for i := 1 to m do R[i] := P[i]; 
    for j := m downto 2 do 
      for i := 1 to j - 1 do begin
        R[i].X := R[i].X + round(t * (R[i + 1].X - R[i].X));
        R[i].Y := R[i].Y + round(t * (R[i + 1].Y - R[i].Y));
      end;
      DrawRect(x, y, R[1].X, R[1].Y);
      t := t + step; x := R[1].X; y := R[1].Y;
  until t > 1;
end.