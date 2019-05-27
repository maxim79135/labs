const MAX_SIZE = 100;

var i, n, nech, j, x: integer;
a : array [1..MAX_SIZE] of integer;
flag : boolean;
begin
    flag := true;
    readln(n);

    if n > MAX_SIZE then begin
        write('Размер не может быть больше 100');
        exit;
    end;

    for i := 1 to n do
    begin
        read(a[i]);
        if (a[i] mod 2 = 1) and (flag) then begin
            nech := i;
            flag := false;
        end
    end;
    inc(nech);

    for i := nech+1 to n do
    begin
        for j := n downto i do
        if (abs(a[j-1])<abs(a[j])) and (a[j-1] mod 2 = 1) and (a[j] mod 2 = 1) or (a[j-1] mod 2 = 0) then
        begin
            x := a[j-1];
            a[j-1] := a[j];
            a[j] := x;
        end;
    end;

    for i := 1 to n do write(a[i], ' ');
    writeln();
end.
