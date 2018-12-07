uses GraphABC; 
 
const
  L = 200;
  sTime = 1;
  dRot = 60;
 
type
  pix3D = record
    X,Y,Z : Real;
    
    constructor; begin (X, Y, Z) := (0, 0, 0); end;
    constructor (X, Y, Z : Real); begin (Self.X, Self.Y, Self.Z) := (X, Y, Z); end;
    
    function rotationX(angle : Real) := new pix3D(X, Y*cos(angle)+Z*sin(angle), -Y*sin(angle)+z*cos(angle));
    function rotationY(angle : Real) := new pix3D(X*cos(angle)-z*sin(angle), Y, X*sin(angle)+Z*cos(angle));
    function rotationZ(angle : Real) := new pix3D(X*cos(angle)+Y*sin(angle), -X*sin(angle)+Y*cos(angle), Z);
    
    function winX := Window.Center.X + Round(X);
    function winY := Window.Center.Y + Round(Y);
  end;
 
var pix : array of pix3D = (
  new pix3D(+L,+L,+L), new pix3D(+L,+L,-L), new pix3D(+L,-L,+L), new pix3D(+L,-L,-L),
  new pix3D(-L,+L,+L), new pix3D(-L,+L,-L), new pix3D(-L,-L,+L), new pix3D(-L,-L,-L)
);
  var rotX, rotY, rotZ : real;
  flag:boolean;
 
procedure Li(a, b : pix3D) := Line(a.winX, a.winY, b.winX, b.winY);
 
procedure DrawCube(angleX, angleY, angleZ : Real);
begin
  var r : array of pix3D;
  SetLength(r, 8);
  for var i := 0 to 7 do r[i] := pix[i].rotationX(angleX).rotationY(angleY).rotationZ(angleZ);
  Li(r[0],r[1]); Li(r[0],r[2]); Li(r[1],r[3]); Li(r[2],r[3]); Li(r[0],r[4]); Li(r[1],r[5]);
  Li(r[4],r[5]); Li(r[2],r[6]); Li(r[4],r[6]); Li(r[3],r[7]); Li(r[5],r[7]); Li(r[6],r[7]);
end;
 
 procedure KeyDown(Key: integer);
var i, t : integer;
begin
   case Key of
    VK_Escape : begin
                 Window.Close;
                end;
    VK_X : begin
                  rotX := rotX + pi/180*3;   
              end;
    
    VK_Y : begin
                  rotY := rotY + pi/180*3;   
              end;
    
    VK_Z : begin
                  rotZ := rotZ + pi/180*3;   
              end;
    
    VK_Add : begin
                for t := 0 to 7 do begin
                  pix[t].x := pix[t].X * 1.1;
                  pix[t].y := pix[t].y * 1.1;
                  pix[t].z := pix[t].z * 1.1;
              end;   
              end;
    
    VK_Subtract : begin
                for t := 0 to 7 do begin
                  pix[t].x := pix[t].X * 0.9;
                  pix[t].y := pix[t].y * 0.9;
                  pix[t].z := pix[t].z * 0.9;
              end;   
              end;
    
    VK_Left : begin
                for t := 0 to 7 do begin
                  pix[t].X := pix[t].X - 5;
                  pix[t].Y := pix[t].Y - 5;
              end;   
              end;
    VK_Right : begin
                for t := 0 to 7 do begin
                  pix[t].X := pix[t].X + 5;
                  pix[t].Y := pix[t].Y + 5;
              end;   
              end;      
    VK_Up : begin
                for t := 0 to 7 do begin
                  pix[t].Z := pix[t].Z - 5;
              end;   
              end;
    VK_Down : begin
                for t := 0 to 7 do begin
                  pix[t].Z := pix[t].Z + 5;
              end;   
              end;
   end;
   FillRect(0, 0, Window.Width, Window.Height);
   DrawCube(rotX, rotY, rotZ);
end;

begin
  Window.Width := 800;
  Window.Height := 800;
  Window.CenterOnScreen;
  OnKeyDown := KeyDown;
  SetPenColor(clRed);
  SetPenWidth(3);
  rotX := pi/6;
  rotY := pi/6;
  rotZ := pi/2;
  DrawCube(rotX,rotY,rotZ);
end.