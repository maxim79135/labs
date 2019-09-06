program lab110;
uses graphABC;
var i,a,x1,x2,y1,y2,x,y,dx,dy,s1,s2,e:integer; 
l:boolean;
begin
writeln('¬ведите координату x1,y1,x2,y2');
read(x1,y1,x2,y2);
clearwindow;
x:=x1; y:=y1; dx:=abs(x2-x1); dy:=abs(y2-y1);
s1:=sign(x2-x1); s2:=sign(y2-y1);
if dy>dx then begin
a:=dy; dy:=dx; dx:=a; l:=true;
end else l:=false;
e:=2*dy-dx;
for i:=1 to dx do begin
setpixel(x,y,clred);
while e>=0 do begin
if l=true then x:=x+s1 else y:=y+s2;
e:=e-2*dx;
end;
if l=true then y:=y+s2 else begin
x:=x+s1; e:=e+2*dy; end;
setpixel(x,y,clred);
end;
end.