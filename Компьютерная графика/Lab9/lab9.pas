uses GraphABC;

type TXYZ = record x, y, z : integer; end;
const V : array [0..7] of TXYZ = (
(x : -15; y :  25; z : -35),
(x : -15; y : -25; z : -35),
(x :  15; y : -25; z : -35),
(x :  15; y :  25; z : -35),
(x :  15; y :  25; z :  35),
(x :  15; y : -25; z :  35),
(x : -15; y : -25; z :  35),
(x : -15; y :  25; z :  35)
);
  dx = 250;

var a, b : array [0..7] of TXYZ;
  i, d, l : integer;

procedure draw_item();
var i : integer;
begin
  for i := 0 to 2 do Line(a[i].x + dx, a[i].y + dx, a[i + 1].x + dx, a[i + 1].y + dx);
  Line(a[3].x + dx, a[3].y + dx, a[0].x + dx, a[0].y + dx);
  for i := 4 to 6 do Line(a[i].x + dx, a[i].y + dx, a[i + 1].x + dx, a[i + 1].y + dx);
  {Line(a[4].x + dx, a[4].y + dx, a[7].x + dx, a[7].y + dx);
  Line(a[0].x + dx, a[0].y + dx, a[5].x + dx, a[5].y + dx);
  Line(a[1].x + dx, a[1].y + dx, a[4].x + dx, a[4].y + dx);
  Line(a[2].x + dx, a[2].y + dx, a[7].x + dx, a[7].y + dx);
  Line(a[3].x + dx, a[3].y + dx, a[6].x + dx, a[6].y + dx);}
end;

begin
  d := 10; l := 1;
  for i := 0 to 7 do begin
    //a[i].x := round(V[i].x / (V[i].z / d + 1));
    //a[i].y := round(V[i].y / (V[i].z / d + 1));
    //a[i].x := V[i].x;
    //a[i].y := V[i].y;
    a[i].x := V[i].x + round(V[i].z * l * cos(pi/4));
    a[i].y := V[i].y + round(V[i].z * l * cos(pi/4));
  end;
  
  draw_item();
end.