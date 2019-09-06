program LabRabKG1Br8;
uses graphABC;
var 
  x1, x2, y1, y2, x, y, dx, dy, s1, s2, e, i, zam:integer; 
  l:boolean;

begin
  writeln('¬ведите координаты первой точки через пробел');
  readln(x1, y1);
  writeln('¬ведите координаты второй точки через пробел');
  readln(x2, y2);
  x:=x1;
  y:=y1;
  dx:=abs(x2-x1);
  dy:=abs(y2-y1);
  s1:=sign(x2-x1);
  s2:=sign(y2-y1);
  if dy>dx then
  begin
//    dx:=dx+dy;
//    dy:=dx-dy;
//    dx:=dx-dy;
    //zam:=dx;
    //dx:=dy;
    //dy:=zam;
    swap(dx,dy);
    l:=true;
  end else
  begin
    l:=false;
  end;
  e:=2*dy-dx;
  for i:=1 to dx do
  begin
  writeln(x, ' ', y);
  //writeln(dx);
  //exit;
    //setPixel(x, y, clBlack);
    while e>=0 do
    begin
      if l=true then
      begin
        x:=x+s1;
      end else
      begin
        y:=y+s2;
        e:=e-2*dx;
      end;
    end;
    if l then
    begin
      y:=y+s2;    
    end else
    begin
      x:=x+s1;
      e:=e+2*dy;
    end;
  end;
  setPixel(x, y, clBlack);
end.