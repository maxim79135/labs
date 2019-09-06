program lab100;
uses graphABC;
var x1,x2,y1,y2,x:integer; m,y:real;
begin
writeln('Введите координаты x1,y1,x2,y2');
read(x1,y1,x2,y2);
clearwindow;
if x1<>x2 then begin
m:=(y2-y1)/(x2-x1); y:=y1;
for x:=x1 to x2 do begin
setpixel(x,round(y),clblack);
y:=y+m;
end;
end else if y1=y2 then setpixel(x1,y1,clblack) else 
writeln('Ошибка');
end. 