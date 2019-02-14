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
  kx = 1.1;
  ky = 1.1;
  wx = 0.9;
  wy = 0.9;
  
var a : array [0..4] of TXY;
  i : integer;
  
procedure draw_item();
var i : integer;
begin
  for i := 0 to 4 do Line(a[i].x + dx, a[i].y + dx, a[(i + 1) mod 5].x + dx, a[(i + 1) mod 5].y + dx);
end;

procedure KeyDown(Key: integer);
var i : integer;
begin
   case Key of
    VK_S : for i := 0 to 4 do begin
             a[i].x := a[i].x + 10;
             a[i].y := a[i].y + 10;
           end;
    VK_x: for i := 0 to 4 do begin
             a[i].x := a[i].x;
             a[i].y := -a[i].y;
           end;
    VK_y: for i := 0 to 4 do begin
             a[i].x := -a[i].x;
             a[i].y := a[i].y;
           end;
    VK_q: for i := 0 to 4 do begin
             a[i].x := round(a[i].x * kx);
             a[i].y := round(a[i].y * ky);
           end;
    VK_w: for i := 0 to 4 do begin
             a[i].x := round(a[i].x * wx);
             a[i].y := round(a[i].y * wy);
           end;   
    VK_e: for i := 0 to 4 do begin
             a[i].x := round(a[i].x * cos(-pi/18) - a[i].y * sin(-pi/18));
             a[i].y := round(a[i].x * sin(-pi/18) + a[i].y * cos(-pi/18));
           end;
    VK_r: for i := 0 to 4 do begin
             a[i].x := round(a[i].x * cos(pi/18) - a[i].y * sin(pi/18));
             a[i].y := round(a[i].x * sin(pi/18) + a[i].y * cos(pi/18));
           end;
           
    VK_Left: for i := 0 to 4 do begin
                a[i].x := a[i].x - 10;
             end;
    VK_Right: for i := 0 to 4 do begin
                a[i].x := a[i].x + 10;
              end;
    VK_Up: for i := 0 to 4 do begin
               a[i].y := a[i].y - 10;
           end;
    VK_Down: for i := 0 to 4 do begin
               a[i].y := a[i].y + 10;
           end;
   end;
   FillRect(0, 0, Window.Width, Window.Height);
   draw_item();
end;

begin
  OnKeyDown := KeyDown;
  SetPenColor(clRed);
  for i := 0 to 4 do 
             a[i] := V[i];
  draw_item();
end.