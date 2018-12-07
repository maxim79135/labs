uses GraphABC;

type TXYZ = record x, y, z : integer; end;
const V : array [0..7] of TXYZ = (
(x :  150; y :  250; z :  35),
(x :  150; y :  250; z : -35),
(x :  150; y : -250; z :  35),
(x :  150; y : -250; z : -35),
(x : -150; y :  250; z :  35),
(x : -150; y :  250; z : -35),
(x : -150; y : -250; z :  35),
(x : -150; y : -250; z : -35)
);
  dx = 300;

var a, b : array [0..7] of TXYZ;
  i, d, l : integer;
  f, p : real;

procedure draw_item();
var i : integer;
begin
  {for i := 0 to 2 do Line(a[i].x + dx, a[i].y + dx, a[i + 1].x + dx, a[i + 1].y + dx);
  Line(a[3].x + dx, a[3].y + dx, a[0].x + dx, a[0].y + dx);
  for i := 4 to 6 do Line(a[i].x + dx, a[i].y + dx, a[i + 1].x + dx, a[i + 1].y + dx);
  Line(a[4].x + dx, a[4].y + dx, a[7].x + dx, a[7].y + dx);
  Line(a[0].x + dx, a[0].y + dx, a[5].x + dx, a[5].y + dx);
  Line(a[1].x + dx, a[1].y + dx, a[4].x + dx, a[4].y + dx);
  Line(a[2].x + dx, a[2].y + dx, a[7].x + dx, a[7].y + dx);
  Line(a[3].x + dx, a[3].y + dx, a[6].x + dx, a[6].y + dx);}
  Line(a[0].x + dx, a[0].y + dx, a[1].x + dx, a[1].y + dx);
  Line(a[0].x + dx, a[0].y + dx, a[2].x + dx, a[2].y + dx);
  Line(a[1].x + dx, a[1].y + dx, a[3].x + dx, a[3].y + dx);
  Line(a[2].x + dx, a[2].y + dx, a[3].x + dx, a[3].y + dx);
  Line(a[0].x + dx, a[0].y + dx, a[4].x + dx, a[4].y + dx);
  Line(a[1].x + dx, a[1].y + dx, a[5].x + dx, a[5].y + dx);
  Line(a[4].x + dx, a[4].y + dx, a[5].x + dx, a[5].y + dx);
  Line(a[2].x + dx, a[2].y + dx, a[6].x + dx, a[6].y + dx);
  Line(a[4].x + dx, a[4].y + dx, a[6].x + dx, a[6].y + dx);
  Line(a[3].x + dx, a[3].y + dx, a[7].x + dx, a[7].y + dx);
  Line(a[5].x + dx, a[5].y + dx, a[7].x + dx, a[7].y + dx);
  Line(a[6].x + dx, a[6].y + dx, a[7].x + dx, a[7].y + dx);
end;

procedure KeyDown(Key: integer);
var i : integer;
begin
   case Key of
    VK_Q : for i := 0 to 7 do begin
             d := 10;
             a[i].x := round(V[i].x / (V[i].z / d + 1));
             a[i].y := round(V[i].y / (V[i].z / d + 1));
           end;
    VK_W : for i := 0 to 7 do begin
             a[i].x := V[i].z;
             a[i].y := V[i].y;
           end;
    VK_E : for i := 0 to 7 do begin
             a[i].x := V[i].x;
             a[i].y := V[i].z;
           end;
    VK_R : for i := 0 to 7 do begin
             a[i].x := V[i].x;
             a[i].y := V[i].y;
           end;
    VK_T : for i := 0 to 7 do begin
             f := 35.264; p := 45;
             a[i].x := round(V[i].x * cos(PI /4 ) + V[i].z * sin(PI / 4));
             a[i].y := round(V[i].x * sin(PI / 180 * f) * sin(PI / 4) + V[i].y * cos(PI / 180 * f) + V[i].z * sin(PI / 180 * f) * cos(PI / 4));
           end;
    VK_Y : for i := 0 to 7 do begin
             f := 20.705; p := 22.208;
             a[i].x := round(V[i].x * cos(PI /4 ) + V[i].z * sin(PI / 4));
             a[i].y := round(V[i].x * sin(PI / 180 * f) * sin(PI / 4) + V[i].y * cos(PI / 180 * f) + V[i].z * sin(PI / 180 * f) * cos(PI / 4));
           end;           
    VK_U : for i := 0 to 7 do begin
             f := 23.705; p := 15.208;
             a[i].x := round(V[i].x * cos(PI /4 ) + V[i].z * sin(PI / 4));
             a[i].y := round(V[i].x * sin(PI / 180 * f) * sin(PI / 4) + V[i].y * cos(PI / 180 * f) + V[i].z * sin(PI / 180 * f) * cos(PI / 4));
           end;       
   end;
   FillRect(0, 0, Window.Width, Window.Height);
   draw_item();
end;


begin
  OnKeyDown := KeyDown;
  SetPenColor(clRed);
end.