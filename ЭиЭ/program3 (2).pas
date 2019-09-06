program laba02;

uses graphABC;

var
  x1, y1, x2, y2, x, dx, dy,s1,s2,e,i,y: integer;
  r, g, b: byte;
  l:boolean;

begin
  readln(x1, y1, x2, y2);
  readln(r, g, b);
  x:=x1;	
  y:=y1;	
  dx:=abs(x2-x1);	
  dy:=abs(y2-y1);
  s1:=sign(x2-x1); 
  s2:=sign(y2-y1);
  if dy < dx then l:=false
  else 
  begin
   swap(dy,dx);
   l:=true;
  end;
  for i:=1 to dx+dy do
   begin
     setpixel(x, y, rgb(r, g, b));
     if e<0 then
      begin
       if l=true then y:=y+s2 else x:=x+s1;
       e:=e+2*dy
      end 
      else 
      begin
        if l=true then x:=x+s1 else y:=y+s2;
        e:=e-2*dx
      end;   
   end;
  setpixel(x, y, rgb(r, g, b)); 
 end.